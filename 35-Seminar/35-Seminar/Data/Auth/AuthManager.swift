//
//  AuthManager.swift
//  35-Seminar
//
//  Created by 조호근 on 11/8/24.
//

import Foundation

final class AuthManager {
    
    static let shared = AuthManager()
    
    private let authService: AuthHandler
    private let tokenManager: TokenStorable
    
    init(
        authService: AuthHandler = UserService.shared,
        tokenManager: TokenStorable = TokenManager.shared
    ) {
        self.authService = authService
        self.tokenManager = tokenManager
    }
    
    func login(
        username: String,
        password: String,
        completion: @escaping (Result<Void, NetworkError>) -> Void
    ) {
        authService.login(username: username, password: password) { [weak self] result in
            switch result {
            case .success(let response):
                _ = self?.tokenManager.save(token: response.result.token)
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func logout() {
        _ = tokenManager.deleteToken()
    }
    
}
