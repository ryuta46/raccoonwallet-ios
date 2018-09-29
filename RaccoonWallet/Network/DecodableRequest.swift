//
//  DecodableRequest.swift
//  RaccoonWallet
//
//  Created by Taizo Kusuda on 2018/08/15.
//  Copyright © 2018年 T TECH, LIMITED LIABILITY CO. All rights reserved.
//

import Foundation
import APIKit

public protocol DecodableRequest: Request {

}

extension DecodableRequest where Response: Decodable {
    public func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try JSONDecoder().decode(Response.self, from: data)
    }
}

public class DecodableGetRequest<T: Decodable>: DecodableRequest {
    public typealias Response = T

    public let method: HTTPMethod = .get
    public let baseURL: URL
    public let path: String
    public let queryParameters: [String: Any]?
    public var dataParser: DataParser {
        return DecodableDataParser()
    }

    init(baseURL: URL, path: String, queryParameters: Dictionary<String, Any> = [:]) {
        self.baseURL = baseURL
        self.path = path
        self.queryParameters = queryParameters
    }

}
