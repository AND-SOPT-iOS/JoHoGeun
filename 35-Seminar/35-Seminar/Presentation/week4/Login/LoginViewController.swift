//
//  LoginViewController.swift
//  35-Seminar
//
//  Created by 조호근 on 11/2/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let authManager: AuthManager = .shared
    private let userService: UserService = .shared
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.layer.borderColor = UIColor.separator.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 12
        textField.setPadding()
        textField.configureDefaultSettings()
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "패스워드"
        textField.layer.borderColor = UIColor.separator.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 12
        textField.configureDefaultSettings()
        textField.setPadding()
        
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .systemBlue
        
        let attributes = AttributeContainer([
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold)
        ])
        config.attributedTitle = AttributedString("로그인", attributes: attributes)
        
        button.configuration = config
        
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .systemGray
        
        let attributes = AttributeContainer([
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold)
        ])
        config.attributedTitle = AttributedString("회원가입", attributes: attributes)
        
        button.configuration = config
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setAction()
    }
    
    private func setStyle() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "로그인"
    }
    
    private func setUI() {
        self.view.addSubviews(
            idTextField,
            passwordTextField,
            loginButton,
            registerButton
        )
    }
    
    private func setLayout() {
        idTextField.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(48)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(48)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(24)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(48)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(48)
        }
    }
    
    private func setAction() {
        let loginAction = UIAction { [weak self] _ in
            self?.loginButtonTapped()
        }
        loginButton.addAction(loginAction, for: .touchUpInside)
        
        let registerAction = UIAction { [weak self] _ in
            self?.registerButtonTapped()
        }
        registerButton.addAction(registerAction, for: .touchUpInside)
    }
    
    private func loginButtonTapped() {
        guard let username = idTextField.text,
              let password = passwordTextField.text else { return }
        
        authManager.login(username: username, password: password) { [weak self] result in
            switch result {
            case .success:
                self?.navigateToProfileView(username: username)
            case .failure(let error):
                self?.showAlertForNetworkError(error)
            }
        }
    }
    
    private func registerButtonTapped() {
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }

}

extension LoginViewController {
    
    private func navigateToProfileView(username: String) {
        let profileVC = ProfileViewController()
        profileVC.configure(with: username)
        navigationController?.setViewControllers([profileVC], animated: true)
    }
    
}

#if DEBUG
import SwiftUI

#Preview {
    LoginViewController().toPreview()
}
#endif
