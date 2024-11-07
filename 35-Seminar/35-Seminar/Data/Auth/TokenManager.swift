//
//  TokenManager.swift
//  35-Seminar
//
//  Created by 조호근 on 11/8/24.
//

import Foundation

protocol TokenStorable {
    
    func save(_ userInfo: UserInfo) -> Bool
    func load() -> UserInfo?
    func deleteToken() -> Bool
    
}

final class TokenManager: TokenStorable {
    
    static let shared = TokenManager()
    private let keychain = KeychainManager.shared
    private let tokenKey = "userInfoToken"
    
    private init() {}
    
    func save(_ userInfo: UserInfo) -> Bool {
        return keychain.save(key: tokenKey, value: userInfo)
    }
    
    func load() -> UserInfo? {
        return keychain.load(key: tokenKey)
    }
    
    func deleteToken() -> Bool {
        return keychain.delete(key: tokenKey)
    }
    
}
