//
//  CharacterService.swift
//  Character
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import Networking

struct CharacterService: ServiceProtocol {
    var path: String { EndpointsEnum.CHARACTERS }
    var method: HTTPMethod { .GET }
    var parameters: Parameters?
    
    init(pageURL: String? = nil) {
        guard let page = pageURL?.split(separator: "=").last else { return }
        parameters = ["page": "\(page)"]
    }
}
