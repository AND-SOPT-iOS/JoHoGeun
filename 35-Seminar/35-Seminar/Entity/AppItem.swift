//
//  AppItem.swift
//  35-Seminar
//
//  Created by 조호근 on 11/1/24.
//

import Foundation

struct AppItem: Hashable {
    
    let id: String
    let rank: Int
    let title: String
    let subtitle: String
    let appImage: String
    let downloadState: DownloadState
    
}

extension AppItem {
    
    static let sampleEssentialDatas: [AppItem] = [
        AppItem(
            id: "com.blind.essential",
            rank: 1,
            title: "Blind",
            subtitle: "직장인 익명 커뮤니티",
            appImage: "blind",
            downloadState: .download
        ),
        AppItem(
            id: "com.bugs.essential",
            rank: 2,
            title: "Bugs",
            subtitle: "음악이 필요한 순간, 벅스",
            appImage: "bugs",
            downloadState: .paid(price: 8800)
        ),
        AppItem(
            id: "com.bunzang.essential",
            rank: 3,
            title: "BunZang",
            subtitle: "당신의 빈 공간을 공유하세요",
            appImage: "bunzang",
            downloadState: .paid(price: 14000)
        ),
        AppItem(
            id: "com.daangn.essential",
            rank: 4,
            title: "당근마켓",
            subtitle: "중고 거래의 시작",
            appImage: "daangn",
            downloadState: .download
        ),
        AppItem(
            id: "com.hyundaicard.essential",
            rank: 5,
            title: "현대카드",
            subtitle: "혁신적인 카드 혜택",
            appImage: "hyundaicard",
            downloadState: .update
        ),
        AppItem(
            id: "com.hyundaidepartment.essential",
            rank: 6,
            title: "현대백화점",
            subtitle: "프리미엄 쇼핑의 시작",
            appImage: "hyundaidepartment",
            downloadState: .download
        ),
        AppItem(
            id: "com.kakaobank.essential",
            rank: 7,
            title: "카카오뱅크",
            subtitle: "쉽고 편리한 은행 서비스",
            appImage: "kakaobank",
            downloadState: .download
        ),
        AppItem(
            id: "com.kakaopay.essential",
            rank: 8,
            title: "카카오페이",
            subtitle: "간편한 결제 서비스",
            appImage: "kakaopay",
            downloadState: .download
        ),
        AppItem(
            id: "com.kbank.essential",
            rank: 9,
            title: "KB국민은행",
            subtitle: "국민의 금융 파트너",
            appImage: "kbank",
            downloadState: .installed
        ),
        AppItem(
            id: "com.kbpay.essential",
            rank: 10,
            title: "KB Pay",
            subtitle: "언제 어디서나 결제 가능",
            appImage: "kbpay",
            downloadState: .download
        ),
        AppItem(
            id: "com.line.essential",
            rank: 11,
            title: "LINE",
            subtitle: "소통이 즐거운 메신저",
            appImage: "line",
            downloadState: .download
        ),
        AppItem(
            id: "com.mega.essential",
            rank: 12,
            title: "MEGA",
            subtitle: "클라우드 저장소",
            appImage: "mega",
            downloadState: .paid(
                price: 3000
            )
        ),
        AppItem(
            id: "com.mobileTmoney.essential",
            rank: 13,
            title: "모바일 티머니",
            subtitle: "편리한 교통 카드",
            appImage: "mobileTmoney",
            downloadState: .download
        ),
        AppItem(
            id: "com.monimo.essential",
            rank: 14,
            title: "monimo",
            subtitle: "삼성 금융 네트워크",
            appImage: "monimo",
            downloadState: .download
        ),
        AppItem(
            id: "com.naverpay.essential",
            rank: 15,
            title: "네이버페이",
            subtitle: "편리한 온라인 결제",
            appImage: "naverpay",
            downloadState: .download
        ),
        AppItem(
            id: "com.pass.essential",
            rank: 16,
            title: "PASS",
            subtitle: "안전한 본인 인증",
            appImage: "pass",
            downloadState: .installed
        ),
        AppItem(
            id: "com.silson24.essential",
            rank: 17,
            title: "실손 24",
            subtitle: "실손 보험 간편 청구",
            appImage: "silson24",
            downloadState: .download
        ),
        AppItem(
            id: "com.starbucks.essential",
            rank: 18,
            title: "스타벅스",
            subtitle: "스타벅스 리워드",
            appImage: "starbucks",
            downloadState: .download
        ),
        AppItem(
            id: "com.toss.essential",
            rank: 19,
            title: "토스",
            subtitle: "간편 송금, 토스",
            appImage: "toss",
            downloadState: .update
        ),
        AppItem(
            id: "com.zigbang.essential",
            rank: 20,
            title: "직방",
            subtitle: "내 방 구하기",
            appImage: "zigbang",
            downloadState: .download
        )
    ]
    
    static let samplePaidDatas: [AppItem] = [
        AppItem(
            id: "com.blind.paid",
            rank: 1,
            title: "Blind",
            subtitle: "직장인 익명 커뮤니티",
            appImage: "blind",
            downloadState: .download
        ),
        AppItem(
            id: "com.bugs.paid",
            rank: 2,
            title: "Bugs",
            subtitle: "음악이 필요한 순간, 벅스",
            appImage: "bugs",
            downloadState: .paid(price: 8800)
        ),
        AppItem(
            id: "com.bunzang.paid",
            rank: 3,
            title: "BunZang",
            subtitle: "당신의 빈 공간을 공유하세요",
            appImage: "bunzang",
            downloadState: .paid(price: 14000)
        ),
        AppItem(
            id: "com.daangn.paid",
            rank: 4,
            title: "당근마켓",
            subtitle: "중고 거래의 시작",
            appImage: "daangn",
            downloadState: .download
        ),
        AppItem(
            id: "com.hyundaicard.paid",
            rank: 5,
            title: "현대카드",
            subtitle: "혁신적인 카드 혜택",
            appImage: "hyundaicard",
            downloadState: .update
        ),
        AppItem(
            id: "com.hyundaidepartment.paid",
            rank: 6,
            title: "현대백화점",
            subtitle: "프리미엄 쇼핑의 시작",
            appImage: "hyundaidepartment",
            downloadState: .download
        ),
        AppItem(
            id: "com.kakaobank.paid",
            rank: 7,
            title: "카카오뱅크",
            subtitle: "쉽고 편리한 은행 서비스",
            appImage: "kakaobank",
            downloadState: .download
        ),
        AppItem(
            id: "com.kakaopay.paid",
            rank: 8,
            title: "카카오페이",
            subtitle: "간편한 결제 서비스",
            appImage: "kakaopay",
            downloadState: .download
        ),
        AppItem(
            id: "com.kbank.paid",
            rank: 9,
            title: "KB국민은행",
            subtitle: "국민의 금융 파트너",
            appImage: "kbank",
            downloadState: .installed
        ),
        AppItem(
            id: "com.kbpay.paid",
            rank: 10,
            title: "KB Pay",
            subtitle: "언제 어디서나 결제 가능",
            appImage: "kbpay",
            downloadState: .download
        ),
        AppItem(
            id: "com.line.paid",
            rank: 11,
            title: "LINE",
            subtitle: "소통이 즐거운 메신저",
            appImage: "line",
            downloadState: .download
        ),
        AppItem(
            id: "com.mega.paid",
            rank: 12,
            title: "MEGA",
            subtitle: "클라우드 저장소",
            appImage: "mega",
            downloadState: .paid(
                price: 3000
            )
        ),
        AppItem(
            id: "com.mobileTmoney.paid",
            rank: 13,
            title: "모바일 티머니",
            subtitle: "편리한 교통 카드",
            appImage: "mobileTmoney",
            downloadState: .download
        ),
        AppItem(
            id: "com.monimo.paid",
            rank: 14,
            title: "monimo",
            subtitle: "삼성 금융 네트워크",
            appImage: "monimo",
            downloadState: .download
        ),
        AppItem(
            id: "com.naverpay.paid",
            rank: 15,
            title: "네이버페이",
            subtitle: "편리한 온라인 결제",
            appImage: "naverpay",
            downloadState: .download
        ),
        AppItem(
            id: "com.pass.paid",
            rank: 16,
            title: "PASS",
            subtitle: "안전한 본인 인증",
            appImage: "pass",
            downloadState: .installed
        ),
        AppItem(
            id: "com.silson24.paid",
            rank: 17,
            title: "실손 24",
            subtitle: "실손 보험 간편 청구",
            appImage: "silson24",
            downloadState: .download
        ),
        AppItem(
            id: "com.starbucks.paid",
            rank: 18,
            title: "스타벅스",
            subtitle: "스타벅스 리워드",
            appImage: "starbucks",
            downloadState: .download
        ),
        AppItem(
            id: "com.toss.paid",
            rank: 19,
            title: "토스",
            subtitle: "간편 송금, 토스",
            appImage: "toss",
            downloadState: .update
        ),
        AppItem(
            id: "com.zigbang.paid",
            rank: 20,
            title: "직방",
            subtitle: "내 방 구하기",
            appImage: "zigbang",
            downloadState: .download
        )
    ]
    
    static let sampleFreeDatas: [AppItem] = [
        AppItem(
            id: "com.blind.free",
            rank: 1,
            title: "Blind",
            subtitle: "직장인 익명 커뮤니티",
            appImage: "blind",
            downloadState: .download
        ),
        AppItem(
            id: "com.bugs.free",
            rank: 2,
            title: "Bugs",
            subtitle: "음악이 필요한 순간, 벅스",
            appImage: "bugs",
            downloadState: .paid(price: 8800)
        ),
        AppItem(
            id: "com.bunzang.free",
            rank: 3,
            title: "BunZang",
            subtitle: "당신의 빈 공간을 공유하세요",
            appImage: "bunzang",
            downloadState: .paid(price: 14000)
        ),
        AppItem(
            id: "com.daangn.free",
            rank: 4,
            title: "당근마켓",
            subtitle: "중고 거래의 시작",
            appImage: "daangn",
            downloadState: .download
        ),
        AppItem(
            id: "com.hyundaicard.free",
            rank: 5,
            title: "현대카드",
            subtitle: "혁신적인 카드 혜택",
            appImage: "hyundaicard",
            downloadState: .update
        ),
        AppItem(
            id: "com.hyundaidepartment.free",
            rank: 6,
            title: "현대백화점",
            subtitle: "프리미엄 쇼핑의 시작",
            appImage: "hyundaidepartment",
            downloadState: .download
        ),
        AppItem(
            id: "com.kakaobank.free",
            rank: 7,
            title: "카카오뱅크",
            subtitle: "쉽고 편리한 은행 서비스",
            appImage: "kakaobank",
            downloadState: .download
        ),
        AppItem(
            id: "com.kakaopay.free",
            rank: 8,
            title: "카카오페이",
            subtitle: "간편한 결제 서비스",
            appImage: "kakaopay",
            downloadState: .download
        ),
        AppItem(
            id: "com.kbank.free",
            rank: 9,
            title: "KB국민은행",
            subtitle: "국민의 금융 파트너",
            appImage: "kbank",
            downloadState: .installed
        ),
        AppItem(
            id: "com.kbpay.free",
            rank: 10,
            title: "KB Pay",
            subtitle: "언제 어디서나 결제 가능",
            appImage: "kbpay",
            downloadState: .download
        ),
        AppItem(
            id: "com.line.free",
            rank: 11,
            title: "LINE",
            subtitle: "소통이 즐거운 메신저",
            appImage: "line",
            downloadState: .download
        ),
        AppItem(
            id: "com.mega.free",
            rank: 12,
            title: "MEGA",
            subtitle: "클라우드 저장소",
            appImage: "mega",
            downloadState: .paid(
                price: 3000
            )
        ),
        AppItem(
            id: "com.mobileTmoney.free",
            rank: 13,
            title: "모바일 티머니",
            subtitle: "편리한 교통 카드",
            appImage: "mobileTmoney",
            downloadState: .download
        ),
        AppItem(
            id: "com.monimo.free",
            rank: 14,
            title: "monimo",
            subtitle: "삼성 금융 네트워크",
            appImage: "monimo",
            downloadState: .download
        ),
        AppItem(
            id: "com.naverpay.free",
            rank: 15,
            title: "네이버페이",
            subtitle: "편리한 온라인 결제",
            appImage: "naverpay",
            downloadState: .download
        ),
        AppItem(
            id: "com.pass.free",
            rank: 16,
            title: "PASS",
            subtitle: "안전한 본인 인증",
            appImage: "pass",
            downloadState: .installed
        ),
        AppItem(
            id: "com.silson24.free",
            rank: 17,
            title: "실손 24",
            subtitle: "실손 보험 간편 청구",
            appImage: "silson24",
            downloadState: .download
        ),
        AppItem(
            id: "com.starbucks.free",
            rank: 18,
            title: "스타벅스",
            subtitle: "스타벅스 리워드",
            appImage: "starbucks",
            downloadState: .download
        ),
        AppItem(
            id: "com.toss.free",
            rank: 19,
            title: "토스",
            subtitle: "간편 송금, 토스",
            appImage: "toss",
            downloadState: .update
        ),
        AppItem(
            id: "com.zigbang.free",
            rank: 20,
            title: "직방",
            subtitle: "내 방 구하기",
            appImage: "zigbang",
            downloadState: .download
        )
    ]
    
}
