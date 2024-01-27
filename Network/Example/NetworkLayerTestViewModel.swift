//
//  NetworkLayerTestViewModel.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2024-01-25.
//

import Foundation
import UIKit
import SwiftUI

class NetworkLayerViewModel: ObservableObject, NetworkServicesMultipart {
    
    // MARK: - PROPERTYS
    let productApiClient = ProductApiClient(client: BaseAPIClient())
    let imageApiClient = AddImageApiClient(client: BaseAPIClient())
    
    @Published var products: [ProductNetworkResponse]?
    @Published var addedProduct: ProductNetworkResponse?
    @Published var addedImage: AddImageNetworkResponse?
    @Published var isError: Bool = false
    
    @Published var testImage = UIImage(named: "clinc")
    
    // MARK: - INITILIZER
    
    init() { }
        
    // MARK: - FUNCTIONS
    
     func fetchProducts() async {
        do {
            products = try await productApiClient.fetchProducts()
            guard  let products = products  else { return }
            print(products)
        } catch {
            print("Error is \(error.localizedDescription)")
            isError = true
        }
    }
    
     func addProduct() async {
        do {
            let parameters = UserDetailsParameters(productParameters: [
                "title":"test product",
                "price": 13,
                "description":"lorem ipsum set",
                "image":"https://i.pravatar.cc",
                "category":"electronic"
            ])
            addedProduct = try await productApiClient.addProduct(parameters: parameters)
            guard  let addedProduct = addedProduct  else { return }
            print(addedProduct)
        } catch {
            print("Error is \(error.localizedDescription)")
            isError = true
        }
    }
    
    func addImage() async {
        do {
            guard let imageData = testImage?.pngData() else { return }
            let dataParameters = AddImageParameters(data: ["file": imageData],
                                                    fileName: "file",
                                                    mimeType: ".png")
            addedImage = try await imageApiClient.addImage(dataParameters: dataParameters)
            guard let addedImage = addedImage else { return }
            print("Added image is \(addedImage)")
        } catch {
            print("Error is \(error.localizedDescription)")
            isError = true
        }
    }
    
    private struct UserDetailsParameters: ProductParametersProtocol {
        var productParameters: [String : Any]
    }
    
    private struct AddImageParameters: MultipartFormData {
        var data: Parameters
        var fileName: String
        var mimeType: String
    }
}

// MARK: - Products API Request
enum ProductsAPIRequest: APIRequestConfiguration {
    case fetchProducts
    case addProduct(parameters: ProductParametersProtocol)
    
    var method: HTTPMethod {
        switch self {
        case .fetchProducts:
            return .get
        case .addProduct:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .fetchProducts:
            return "/products"
        case .addProduct:
            return "/products"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .fetchProducts:
            return nil
        case .addProduct(let parameters):
            return parameters.productParameters
        }
    }

    var headers: HTTPHeaders? {
      nil
    }
}

/// dependency injection
protocol ProductParametersProtocol {
    var productParameters: [String: Any] { get }
}

// MARK: - Product API Client

protocol ProductAPIClientProtocol {
  func fetchProducts() async throws -> [ProductNetworkResponse]?
  func addProduct(parameters: ProductParametersProtocol) async throws -> ProductNetworkResponse?
}

class ProductApiClient: ProductAPIClientProtocol {
    let client: BaseAPIClientProtocol
    init(client: BaseAPIClientProtocol) {
        self.client = client
    }
    
    func fetchProducts() async throws -> [ProductNetworkResponse]? {
        let request = ProductsAPIRequest.fetchProducts
        var products: [ProductNetworkResponse]?
        products = try await client.perform(request)
        return products
    }
    
    func addProduct(parameters: ProductParametersProtocol) async throws -> ProductNetworkResponse? {
        let request = ProductsAPIRequest.addProduct(parameters: parameters)
        var product: ProductNetworkResponse?
        product = try await client.perform(request)
        return product
    }
}


// MARK: - Model

struct ProductNetworkResponse: Codable {
    var id: Int?
    var title: String?
    var category: String?
    var description: String?
}

// MARK: - Formdata
enum AddImageAPIRequest: MultipartAPIRequestConfiguration {
case addImage(dataParameters: MultipartFormData)
        
    var method: HTTPMethod {
        return .post
    }
    
    var path: String {
        return "/api/v1/files/upload"
    }
    
    var parameters: Parameters? {
        nil
    }
    
    var headers: HTTPHeaders? {
        nil
    }
    
    var multipartFormData: MultipartFormData? {
        switch self {
        case .addImage(let parameter):
            return parameter
        }
    }
}

// MARK: - Product API Client

protocol AddImageAPIClientProtocol {
  func addImage(dataParameters: MultipartFormData) async throws -> AddImageNetworkResponse?
}

class AddImageApiClient: AddImageAPIClientProtocol {
    let client: BaseAPIClientProtocol
    init(client: BaseAPIClientProtocol) {
        self.client = client
    }
    
    func addImage(dataParameters: MultipartFormData) async throws -> AddImageNetworkResponse? {
        let request = AddImageAPIRequest.addImage(dataParameters: dataParameters)
        var image: AddImageNetworkResponse?
        image = try await client.perform(request)
        return image
    }
}


// MARK: - Model

struct AddImageNetworkResponse: Codable {
    var originalname: String?
    var filename: String?
    var location: String?
}
