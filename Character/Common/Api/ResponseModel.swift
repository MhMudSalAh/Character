//
//  ResponseModel.swift
//  Character
//
//  Created by MhMuD SalAh on 23/08/2025.
//

import Foundation

struct ResponseModel<T: Decodable>: Decodable {
    let page: PageModel?
    let data: T
}

extension ResponseModel {
    enum CodingKeys: String, CodingKey {
        case page = "info"
        case data = "results"
    }
}
