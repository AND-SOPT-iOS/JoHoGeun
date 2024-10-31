//
//  Banner.swift
//  35-Seminar
//
//  Created by 조호근 on 11/1/24.
//

import Foundation

struct Banner: Hashable {
    
    let id = UUID()
    let badge: String
    let title: String
    let subtitle: String
    let bannerImage: String
    let description: String
    let downloadState: DownloadState
    
}

extension Banner {
    
    static let sampleBanners: [Banner] = [
        Banner(
            badge: "새로운 앱",
            title: "Elk - 여행 환율 변환기",
            subtitle: "언제 어디서나 간편한 환율 체크",
            bannerImage: "banner1",
            description: "Winner of ADA 2017",
            downloadState: .download
        ),
        Banner(
            badge: "추천",
            title: "Currenzy",
            subtitle: "빠르고 쉬운 환율 계산",
            bannerImage: "banner2",
            description: "금융",
            downloadState: .paid(price: 6600)
        ),
        Banner(
            badge: "새로운 경험",
            title: "Fortune City - A Finance App",
            subtitle: "게임을 하듯 관리하는 가계부",
            bannerImage: "banner3",
            description: "좋은 소비습관을 만들어 보세요!",
            downloadState: .download
        ),
        Banner(
            badge: "추천",
            title: "Taxnote 부기 및 회계 앱",
            subtitle: "간편한 장부 관리",
            bannerImage: "banner4",
            description: "자영업자용 세금 환급을 위한 부기 및 회계 앱",
            downloadState: .update
        )
    ]
    
}
