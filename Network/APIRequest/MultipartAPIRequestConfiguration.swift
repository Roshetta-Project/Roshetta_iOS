//
//  MultipartAPIRequestConfiguration.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-12-11.
//

import Foundation

protocol MultipartAPIRequestConfiguration: APIRequestConfiguration {
    var multipartFormData: MultipartFormData? { get }
}

protocol MultipartFormData {
    var data: Data { get }
    var name: String { get }
    var fileName: String { get }
    var mimeType: String { get }
}
