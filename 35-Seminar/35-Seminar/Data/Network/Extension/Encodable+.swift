//
//  Encodable+.swift
//  35-Seminar
//
//  Created by 조호근 on 11/8/24.
//

import Foundation

extension Encodable {
    
    func toDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self),
              let jsonData = try? JSONSerialization.jsonObject(with: data),
              let dictionaryData = jsonData as? [String: Any] else { return [:] }
        return dictionaryData
    }
    
}
