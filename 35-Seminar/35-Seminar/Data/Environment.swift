//
//  Environment.swift
//  35-Seminar
//
//  Created by 조호근 on 11/2/24.
//

import Foundation

enum Environment {
  static let baseURL: String = Bundle.main.infoDictionary?["BASE_URL"] as! String
}
