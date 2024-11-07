//
//  KeychainManager.swift
//  35-Seminar
//
//  Created by 조호근 on 11/8/24.
//

import Foundation

final class KeychainManager {
    
    static let shared = KeychainManager()
    private init() {}
    
    func save(key: String, value: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecValueData as String: value.data(using: .utf8)!
        ]
        
        SecItemDelete(query as CFDictionary)
        return SecItemAdd(query as CFDictionary, nil) == errSecSuccess
    }
    
    func load(key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == errSecSuccess {
            if let data = dataTypeRef as? Data,
               let value = String(data: data, encoding: .utf8) {
                return value
            }
        }
        return nil
    }
    
    func delete(key: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        return SecItemDelete(query as CFDictionary) == errSecSuccess
    }
    
}
