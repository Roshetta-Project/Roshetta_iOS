//
//  HTTPClient.swift
//  Almursheed
//
//  Created by Abdalazem Saleh on 2023-08-27.
//

import Foundation

protocol NetworkServicesMultipart {
    func request(endPoint: EndPoint, imagesData: [String: Any]?) async throws -> Data
}

extension NetworkServicesMultipart {
    func request(endPoint: EndPoint, imagesData: [String: Any]?) async throws -> Data {
        // URL Components
        var urlComponents = URLComponents()
        urlComponents.scheme = endPoint.scheme
        urlComponents.host = endPoint.host
        urlComponents.path = endPoint.path
        guard let url = urlComponents.url else { throw RequestError.invalidURL }
                
        do {
            // Request
            var request = URLRequest(url: url)
            request.timeoutInterval = 30
            request.httpMethod = endPoint.method.method
            
            // Create the boundary for the multipart/form-data request
            let boundary = "Boundary-\(UUID().uuidString)"
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            // Create the request body as a Data object
            var requestBody = Data()
            
            // About images
            if let imagesData = imagesData {
                for (key, value) in imagesData {
                    if let singleImageData = value as? Data {
                        requestBody.append("--\(boundary)\r\n".data(using: .utf8)!)
                        requestBody.append("Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(key).png\"\r\n".data(using: .utf8)!)
                        requestBody.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
                        requestBody.append(singleImageData)
                        requestBody.append("\r\n".data(using: .utf8)!)
                    } else if let imageArrayData = value as? [Data] {
                        for (index, imageData) in imageArrayData.enumerated() {
                            let fieldName = "\(key)_\(index)"
                            
                            requestBody.append("--\(boundary)\r\n".data(using: .utf8)!)
                            requestBody.append("Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(fieldName).png\"\r\n".data(using: .utf8)!)
                            requestBody.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
                            requestBody.append(imageData)
                            requestBody.append("\r\n".data(using: .utf8)!)
                        }
                    }
                }
            }
            
            if let parms = endPoint.body {
                for (key, value) in parms {
                    if let arrayValue = value as? [String] {
                        print(arrayValue)
                        for (index, item) in arrayValue.enumerated() {
                            let formattedKey = "\(key)[\(index)]"
                            requestBody.append("--\(boundary)\r\n".data(using: .utf8)!)
                            requestBody.append("Content-Disposition: form-data; name=\"\(formattedKey)\"\r\n\r\n".data(using: .utf8)!)
                            requestBody.append("\(item)\r\n".data(using: .utf8)!)
                            requestBody.append("--\(boundary)--\r\n".data(using: .utf8)!)
                        }
                    } else if let stringValue = value as? String {
                        print(stringValue)
                        requestBody.append("--\(boundary)\r\n".data(using: .utf8)!)
                        requestBody.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
                        requestBody.append("\(stringValue)\r\n".data(using: .utf8)!)
                        requestBody.append("--\(boundary)--\r\n".data(using: .utf8)!)
                    } else if value is [String: Any] {
                        let body = try JSONSerialization.data(withJSONObject: parms)
                        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                        if let jsonString = String(data: body, encoding: .utf8) {
                            print(jsonString)
                        }
                        requestBody = body
                    }
                }
            }

            // Set the request body
            if (endPoint.body) != nil {
                request.httpBody = requestBody
            }
            
            if let header = endPoint.header {
                request.allHTTPHeaderFields = header
            }

            // Create a custom URLSessionConfiguration with a timeout interval of 10 seconds
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForResource = 60
            
            // Create the URLSession with the custom configuration
            let session = URLSession(configuration: configuration)
            
            // Start session
            let (data, response) = try await session.data(for: request)
            
            if let jsonString = String(data: data, encoding: .utf8) {
               print(jsonString)
            }

            // Check connection, response, and response type
            guard let response = response as? HTTPURLResponse else { throw RequestError.noResponse }
            let statusCode = response.statusCode
            switch statusCode {
            case 200...299:
                return data
            case 401:
                throw RequestError.unauthorized
            case 403:
                throw RequestError.forbidden
            case 404:
                throw RequestError.notFounded
            case 405:
                throw RequestError.notAllowed
            case 422:
                throw RequestError.validationError
            default:
                throw RequestError.unknown
            }
        } catch {
            if (error as NSError).code == NSURLErrorTimedOut {
                throw RequestError.timeOut
            } else {
                throw error
            }
        }
    }
}
