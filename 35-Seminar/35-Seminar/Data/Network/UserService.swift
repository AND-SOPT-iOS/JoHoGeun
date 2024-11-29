//
//  UserService.swift
//  35-Seminar
//
//  Created by 조호근 on 11/2/24.
//

import Foundation
import Alamofire

protocol AuthHandler {
    
    func login(
        username: String,
        password: String,
        completion: @escaping (Result<LoginResponse, NetworkError>) -> Void
    )
    
}

protocol UserHandler {
    
    func register(
        username: String,
        password: String,
        hobby: String,
        completion: @escaping (Result<RegisterResponse, NetworkError>) -> Void
    )
    
    func getMyHobby(
        completion: @escaping (Result<MyHobbyResponse, NetworkError>) -> Void
    )
    
    func updateUser(
        hobby: String,
        password: String,
        completion: @escaping (Result<UpdateUserResponse, NetworkError>) -> Void
    )
    
}

class UserService {

    static let shared = UserService()
    private let session: Session
    private let tokenManager: TokenStorable
    
    private init(
        session: Session = .default,
        tokenManager: TokenStorable = TokenManager.shared
    ) {
        self.session = session
        self.tokenManager = tokenManager
    }
    
    private func request<T: Decodable>(_ api: UserAPI, completion: @escaping (Result<T, NetworkError>) -> Void) {
        let url = api.baseURL + api.path
        
        var headers: HTTPHeaders = [:]
        if api.isTokenRequired {
            guard let userInfo = tokenManager.load() else {
                completion(.failure(.unknownError))
                return
            }
            let token = userInfo.token
            headers["token"] = token
        }
        
        session.request(
            url,
            method: api.method,
            parameters: api.parameters,
            encoding: JSONEncoding.default,
            headers: headers
        )
        .validate()
        .response { [weak self] response in
            guard let self = self,
                  let statusCode = response.response?.statusCode else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success(let data):
                if let data = data, !data.isEmpty {
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decodedData))
                    } catch {
                        completion(.failure(.decodingError))
                    }
                } else {
                    if let emptyResponse = UpdateUserResponse() as? T {
                        completion(.success(emptyResponse))
                    } else {
                        completion(.failure(.decodingError))
                    }
                }
            case .failure:
                guard let data = response.data else {
                    completion(.failure(.unknownError))
                    return
                }
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    private func handleStatusCode(_ statusCode: Int, data: Data) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "00"):
            return .invalidRequest
        case (400, "01"):
            return .expressionError
        case (404, ""):
            return .invalidURL
        case (409, "00"):
            return .duplicateError
        case (500, ""):
            return .serverError
        default:
            return .unknownError
        }
    }
    
    private func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(
            ErrorResponse.self,
            from: data
        ) else { return "" }
        return errorResponse.code
    }
    
}

extension UserService: AuthHandler {
    
    func login(
        username: String,
        password: String,
        completion: @escaping (Result<LoginResponse, NetworkError>) -> Void
    ) {
        let request = LoginRequest(username: username, password: password)
        self.request(.login(request), completion: completion)
    }
    
}

extension UserService: UserHandler {
    
    func register(
        username: String,
        password: String,
        hobby: String,
        completion: @escaping (Result<RegisterResponse, NetworkError>) -> Void
    ) {
        let request = RegisterRequest(username: username, password: password, hobby: hobby)
        self.request(.register(request), completion: completion)
    }
    
    func getMyHobby(
        completion: @escaping (Result<MyHobbyResponse, NetworkError>) -> Void
    ) {
        self.request(.myHobby, completion: completion)
    }
    
    func updateUser(
        hobby: String,
        password: String,
        completion: @escaping (Result<UpdateUserResponse, NetworkError>) -> Void
    ) {
        let request = UpdateUserRequest(hobby: hobby, password: password)
        self.request(.updateUser(request), completion: completion)
    }
    
}
