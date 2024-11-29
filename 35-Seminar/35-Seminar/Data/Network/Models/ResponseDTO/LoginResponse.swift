//
//  LoginResponse.swift
//  35-Seminar
//
//  Created by 조호근 on 11/8/24.
//

import Foundation

struct LoginResponse: Decodable {
    
    let result: Result
    
    struct Result: Decodable {
        
        let token: String
        
    }
    
}
