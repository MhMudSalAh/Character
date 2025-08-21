//
//  APIError.swift
//  Networking
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import Foundation

struct APIError: Error {
    var code: Int?
    var message: String?
    var type: APIErrorType?
}
