//
//  URLComponents+Extension.swift
//  Networking
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import Foundation

extension URLComponents {
    
    init(service: ServiceProtocol) {
        let urlString = (Bundle.main.infoDictionary!["BaseURL"] as! String)
        let baseUrl = URL(string: urlString)
        let path = service.path
        let url = baseUrl!.appendingPathComponent(path)
        
        self.init(url: url, resolvingAgainstBaseURL: false)!
        
        guard let parameters = service.parameters else { return }
        
        queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: String(describing: value))
        }
    }
}
