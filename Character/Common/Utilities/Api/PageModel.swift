//
//  PageModel.swift
//  Character
//
//  Created by MhMuD SalAh on 23/08/2025.
//

import Foundation

struct PageModel: Decodable {
    let itemsCount: Int
    let pages: Int
    let next: String?
    let previous: String?
}

extension PageModel {
    enum CodingKeys: String, CodingKey {
        case itemsCount = "count"
        case pages
        case next
        case previous = "prev"
    }
}
