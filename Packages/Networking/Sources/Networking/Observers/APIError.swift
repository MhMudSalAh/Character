//
//  APIError.swift
//  Networking
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import Foundation

public struct APIError: Error {
    var code: Int?
    var message: String?
    var type: APIErrorType?
    
    public init(
        code: Int? = nil,
        message: String? = nil,
        type: APIErrorType? = nil
    ) {
        self.code = code
        self.message = message
        self.type = type
    }
}
