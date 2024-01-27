//
//  MultipartURLRequestStrategy.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-12-11.
//

import Foundation

struct MultipartURLRequestStrategy: URLRequestConvertible {
    let configuration: MultipartAPIRequestConfiguration
    
    private let boundary = "Boundary-\(UUID().uuidString)"
    private var multipartHeaders: HTTPHeaders {
        let headers = [
            "Content-Type": "multipart/form-data; boundary=\(boundary)",
            "Accept": "application/json",
        ]
        return headers
    }
    
    func asURLRequest() throws -> URLRequest {
        /// URL Components
        var components = configuration.components
        components.scheme = "https"
        components.host = "api.escuelajs.co"
        components.path = configuration.path
        
        /// URL
        guard let url = components.url else { throw SessionDataTaskError.invalidURL }
        /// Request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = configuration.method.method
        
        /// Headers
        let requestHeaders = multipartHeaders
        requestHeaders.forEach {
            urlRequest.addValue($1, forHTTPHeaderField: $0)
        }
        
        /// Create the request body as a Data object
        var requestBody = Data()
        
        /// Handel request parms
        if let parameters = configuration.multipartFormData {
            appendParametersToBody()
            appendDataToBody(imagesData: parameters.data)
        }
        
        /// Append parameters to request body
        func appendParametersToBody() {
            if let parameters = configuration.parameters {
                for (key, value) in parameters {
                    if let arrayValue = value as? [String] {
                        appendArrayValue(arrayValue, forKey: key, to: &requestBody, using: boundary)
                    } else if let stringValue = value as? String {
                        appendStringValue(stringValue, forKey: key, to: &requestBody, using: boundary)
                    }
                }
            }
            requestBody.append("--\(boundary)--\r\n".data(using: .utf8)!)
        }
        
        /// Append data to request body
        func appendDataToBody(imagesData: [String: Any])  {
            for (key, value) in imagesData {
                if let imageArrayData = value as? [Data] {
                    appendImageDataArray(key: key, imageArrayData: imageArrayData)
                } else if let singleImageData = value as? Data {
                    appendSingleImageData(key: key, imageData: singleImageData)
                }
            }
        }
        
        /// Handel append of values to specific key
        func appendArrayValue(_ value: [String], forKey key: String, to requestBody: inout Data, using boundary: String) {
            for (index, item) in value.enumerated() {
                let formattedKey = "\(key)[\(index)]"
                appendMultipartHeader(for: formattedKey, to: &requestBody, using: boundary)
                appendMultipartData(item, to: &requestBody)
            }
        }
        
        /// Handel append value to key
        func appendStringValue(_ value: String, forKey key: String, to requestBody: inout Data, using boundary: String) {
            appendMultipartHeader(for: key, to: &requestBody, using: boundary)
            appendMultipartData(value, to: &requestBody)
        }
        
        /// Append multipart header
        func appendMultipartHeader(for key: String, to requestBody: inout Data, using boundary: String) {
            requestBody.append("--\(boundary)\r\n".data(using: .utf8)!)
            requestBody.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
        }
        /// Append multipartdata
        func appendMultipartData(_ value: String, to requestBody: inout Data) {
            requestBody.append("\(value)\r\n".data(using: .utf8)!)
        }
        
        /// Append an array of image data to request body
        func appendImageDataArray(key: String, imageArrayData: [Data]) {
            for (index, imageData) in imageArrayData.enumerated() {
                let fieldName = "\(key)_\(index)"
                appendImageData(fieldName: fieldName, imageData: imageData)
            }
        }
        
        /// Append a single image data to request body
        func appendSingleImageData(key: String, imageData: Data) {
            appendImageData(fieldName: key, imageData: imageData)
        }
        
        /// Append image data to request body
        func appendImageData(fieldName: String, imageData: Data) {
            requestBody.append("--\(boundary)\r\n".data(using: .utf8)!)
            requestBody.append("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fieldName)hell.png\"\r\n".data(using: .utf8)!)
            requestBody.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
            requestBody.append(imageData)
            requestBody.append("\r\n".data(using: .utf8)!)
        }

        urlRequest.httpBody = requestBody
        
        
        /// Return
        return urlRequest
    }
}
