//
//  UserAPI.swift
//  35-Seminar
//
//  Created by 조호근 on 11/8/24.
//

import Alamofire

enum UserAPI {
    
    case register(RegisterRequest)
    case login(LoginRequest)
    case myHobby
    case updateUser(UpdateUserRequest)
}

extension UserAPI {
    
    var baseURL: String {
        return Environment.baseURL
    }

    var method: HTTPMethod {
        switch self {
        case .register, .login:
            return .post
        case .myHobby:
            return .get
        case .updateUser:
            return .put
        }
    }
    
    var path: String {
        switch self {
        case .register, .updateUser:
            return "/user"
        case .login:
            return "/login"
        case .myHobby:
            return "/user/my-hobby"
        }
    }
    
    var isTokenRequired: Bool {
        switch self {
        case .myHobby, .updateUser:
            return true
        default:
            return false
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .register(let request):
            return request.toDictionary()
        case .login(let request):
            return request.toDictionary()
        case .updateUser(let request):
            return request.toDictionary()
        case .myHobby:
            return nil
        }
    }
    
}
