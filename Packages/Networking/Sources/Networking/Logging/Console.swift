//
//  Console.swift
//  Networking
//
//  Created by MhMuD SalAh on 22/08/2025.
//

import Foundation

open class Console {
    
    static func logAPI(
        url: String?,
        headers: [String:String]?,
        body: String?,
        statusCode: Int,
        response: String?,
        requestTime: TimeInterval,
        error: APIError?
    ) {
        
        lineStart()
        
        switch statusCode {
        case 200 ... 299:
            LOG("✅ State", "🏆 Success")
        default:
            LOG("❌ State", "🔥 Error:- \(error?.message ?? "")")
        }
        
        if let type = error?.type {
            LOG("🔥 Error Type", type)
        }
        
        LOG("🔗 Url", url)
        LOG("⏳ Time", "\(requestTime)s")
        LOG("⚡️ Status Code", statusCode)
        LOG("👉🏻 Headers", headers)
        LOG("💭 Body", body)
        LOG("📬 Response", response)
        
        lineEnd()
    }
        
    static func LOG(_ tag: String, _ text: Any?) {
        print("\(tag): \(text ?? "🚫")")
    }
    
    static func lineStart() {
        print("\n↘️----------------------------------------------↙️\n")
    }
    
    static func lineEnd() {
        print("\n↗️----------------------------------------------↖️\n")
    }
}
