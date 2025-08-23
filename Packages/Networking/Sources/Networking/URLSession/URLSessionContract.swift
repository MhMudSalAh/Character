//
//  URLSessionContract.swift
//  Networking
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import Foundation

public protocol URLSessionProviderProtocol {
    func request<T: Decodable>(service: ServiceProtocol) async -> Result<T, APIError>
}
