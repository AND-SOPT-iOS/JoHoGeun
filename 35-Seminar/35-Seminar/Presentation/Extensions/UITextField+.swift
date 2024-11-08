//
//  UITextField+.swift
//  35-Seminar
//
//  Created by 조호근 on 11/8/24.
//

import UIKit

extension UITextField {
    
    func configureDefaultSettings() {
        self.backgroundColor = .systemGray6
        self.autocorrectionType = .no           // 자동 수정 비활성화
        self.spellCheckingType = .no            // 맞춤법 검사 비활성화
        self.autocapitalizationType = .none     // 자동 대문자 비활성화
        self.clearButtonMode = .always          // 입력내용 한번에 지우는 x버튼(오른쪽)
        self.clearsOnBeginEditing = false       // 편집 시 기존 텍스트필드값 초기화 안되게끔
    }
    
    func setPadding(left: CGFloat = 12, right: CGFloat = 12) {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.height))
        self.leftView = leftView
        self.leftViewMode = .always
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.height))
        self.rightView = rightView
        self.rightViewMode = .always
    }
    
}

