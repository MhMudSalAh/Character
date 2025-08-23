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
}
