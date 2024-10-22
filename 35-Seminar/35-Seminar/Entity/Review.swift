//
//  Review.swift
//  35-Seminar
//
//  Created by 조호근 on 10/22/24.
//

import Foundation

struct Review {
    let title: String
    let rating: Int
    let date: Date
    let author: String
    let content: String
    
    static let defaultReview = Review(
        title: "조호근",
        rating: 5,
        date: Date(),
        author: "ENTJ",
        content: "동해물과 백두산이 마르고 닳도록, 하느님이 보우하사 우리나라 만세"  
    )
    
    static func createNewReview(title: String, content: String) -> Review {
        return Review(
            title: title,
            rating: 2,
            date: Date(),
            author: "조호근",
            content: content
        )
    }
}
