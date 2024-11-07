//
//  RegisterRequest.swift
//  35-Seminar
//
//  Created by 조호근 on 11/2/24.
//

import Foundation

/// 유저 등록 API
/// 각 프로퍼티는 8자 이하여야 함
struct RegisterRequest: Codable {
  let username: String
  let password: String
  let hobby: String
}
