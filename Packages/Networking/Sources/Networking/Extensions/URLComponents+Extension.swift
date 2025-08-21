//
//  URLComponents+Extension.swift
//  Networking
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import Foundation

extension URLComponents {
    
    init(service: ServiceProtocol) {
        let url = URL(string: service.path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        
        
        self.init(url: url, resolvingAgainstBaseURL: false)!
        
        
        guard let parameters = service.parameters else { return }
        
        queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: String(describing: value))
        }
    }
}
