//
//  LoginViewController.swift
//  35-Seminar
//
//  Created by 조호근 on 11/2/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.layer.borderColor = UIColor.separator.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 12
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "패스워드"
        textField.layer.borderColor = UIColor.separator.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 12
        
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .systemGray
        
        let attributes = AttributeContainer([
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold)
        ])
        config.attributedTitle = AttributedString("열기", attributes: attributes)
        
        button.configuration = config
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        self.view.addSubviews(idTextField, passwordTextField, loginButton)
    }
    
    private func setLayout() {
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(40)
        }
        
        
    }

}

#if DEBUG
import SwiftUI

#Preview {
    LoginViewController().toPreview()
}
#endif
