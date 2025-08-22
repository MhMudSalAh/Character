//
//  Api.swift
//  Character
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import Networking
import Foundation

extension ServiceProtocol {
    var path: String {
        baseUrl + path
    }
    
    var baseUrl: String {
        "https://" + (Bundle.main.infoDictionary!["BaseURL"] as! String)
    }
}
