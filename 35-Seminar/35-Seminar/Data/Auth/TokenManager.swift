//
//  TokenManager.swift
//  35-Seminar
//
//  Created by 조호근 on 11/8/24.
//

import Foundation

protocol TokenStorable {
    
    func save(token: String) -> Bool
    func getToken() -> String?
    func deleteToken() -> Bool
    
}

final class TokenManager: TokenStorable {
    
    static let shared = TokenManager()
    private let keychain = KeychainManager.shared
    private let tokenKey = "userToken"
    
    private init() {}
    
    func save(token: String) -> Bool {
        return keychain.save(key: tokenKey, value: token)
    }
    
    func getToken() -> String? {
        return keychain.load(key: tokenKey)
    }
    
    func deleteToken() -> Bool {
        return keychain.delete(key: tokenKey)
    }
    
}
