//
//  AppItem.swift
//  35-Seminar
//
//  Created by 조호근 on 11/1/24.
//

import Foundation

struct AppItem: Hashable {
    
    let id = UUID()
    let rank: Int
    let title: String
    let subtitle: String
    let appImage: String
    let downloadState: DownloadState
    
}

extension AppItem {
    
    static let sampleData: [AppItem] = [
        AppItem(
            rank: 1,
            title: "Blind",
            subtitle: "직장인 익명 커뮤니티",
            appImage: "blind",
            downloadState: .download
        ),
        AppItem(
            rank: 2,
            title: "Bugs",
            subtitle: "음악이 필요한 순간, 벅스",
            appImage: "bugs",
            downloadState: .paid(price: 8800)
        ),
        AppItem(
            rank: 3,
            title: "BunZang",
            subtitle: "당신의 빈 공간을 공유하세요",
            appImage: "bunznag",
            downloadState: .paid(price: 14000)
        ),
        AppItem(
            rank: 4,
            title: "당근마켓",
            subtitle: "중고 거래의 시작",
            appImage: "daangn",
            downloadState: .download
        ),
        AppItem(
            rank: 5,
            title: "현대카드",
            subtitle: "혁신적인 카드 혜택",
            appImage: "hyundaicard",
            downloadState: .update
        ),
        AppItem(
            rank: 6,
            title: "현대백화점",
            subtitle: "프리미엄 쇼핑의 시작",
            appImage: "hyundaidepartment",
            downloadState: .download
        ),
        AppItem(
            rank: 7,
            title: "카카오뱅크",
            subtitle: "쉽고 편리한 은행 서비스",
            appImage: "kakaobank",
            downloadState: .download
        ),
        AppItem(
            rank: 8,
            title: "카카오페이",
            subtitle: "간편한 결제 서비스",
            appImage: "kakaopay",
            downloadState: .download
        ),
        AppItem(
            rank: 9,
            title: "KB국민은행",
            subtitle: "국민의 금융 파트너",
            appImage: "kbank",
            downloadState: .installed
        ),
        AppItem(
            rank: 10,
            title: "KB Pay",
            subtitle: "언제 어디서나 결제 가능",
            appImage: "kbpay",
            downloadState: .download
        ),
        AppItem(
            rank: 11,
            title: "LINE",
            subtitle: "소통이 즐거운 메신저",
            appImage: "line",
            downloadState: .download
        ),
        AppItem(
            rank: 12,
            title: "MEGA",
            subtitle: "클라우드 저장소",
            appImage: "mega",
            downloadState: .paid(
                price: 3000
            )
        ),
        AppItem(
            rank: 13,
            title: "모바일 티머니",
            subtitle: "편리한 교통 카드",
            appImage: "mobileTmoney",
            downloadState: .download
        ),
        AppItem(
            rank: 14,
            title: "monimo",
            subtitle: "삼성 금융 네트워크",
            appImage: "monimo",
            downloadState: .download
        ),
        AppItem(
            rank: 15,
            title: "네이버페이",
            subtitle: "편리한 온라인 결제",
            appImage: "naverpay",
            downloadState: .download
        ),
        AppItem(
            rank: 16,
            title: "PASS",
            subtitle: "안전한 본인 인증",
            appImage: "pass",
            downloadState: .installed
        ),
        AppItem(
            rank: 17,
            title: "실손 24",
            subtitle: "실손 보험 간편 청구",
            appImage: "silson24",
            downloadState: .download
        ),
        AppItem(
            rank: 18,
            title: "스타벅스",
            subtitle: "스타벅스 리워드",
            appImage: "starbucks",
            downloadState: .download
        ),
        AppItem(
            rank: 19,
            title: "토스",
            subtitle: "간편 송금, 토스",
            appImage: "toss",
            downloadState: .update
        ),
        AppItem(
            rank: 20,
            title: "직방",
            subtitle: "내 방 구하기",
            appImage: "zigbang",
            downloadState: .download
        )
    ]
    
}
