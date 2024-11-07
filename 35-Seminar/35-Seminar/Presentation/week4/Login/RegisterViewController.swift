//
//  RegisterViewController.swift
//  35-Seminar
//
//  Created by 조호근 on 11/8/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let userService: UserHandler = UserService.shared
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.layer.borderColor = UIColor.separator.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 12
        textField.setPadding()
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "패스워드"
        textField.layer.borderColor = UIColor.separator.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 12
        textField.setPadding()
        
        return textField
    }()
    
    private let hobbyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "취미"
        textField.layer.borderColor = UIColor.separator.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 12
        textField.setPadding()
        
        return textField
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .systemBlue
        
        let attributes = AttributeContainer([
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold)
        ])
        config.attributedTitle = AttributedString("완료", attributes: attributes)
        
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
        navigationItem.title = "회원가입"
    }
    
    private func setUI() {
        view.addSubviews(
            idTextField,
            passwordTextField,
            hobbyTextField,
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
        
        hobbyTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(48)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(24)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(48)
        }
    }
    
    private func setAction() {
        let registerAction = UIAction { [weak self] _ in
            self?.registerButtonTapped()
        }
        registerButton.addAction(registerAction, for: .touchUpInside)
    }
    
    private func registerButtonTapped() {
        guard let username = idTextField.text,
              let password = passwordTextField.text,
              let hobby = hobbyTextField.text else { return }
        
        userService.register(
            username: username,
            password: password,
            hobby: hobby) { [weak self] result in
                switch result {
                case .success:
                    self?.showRegistrationSuccess()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    private func showRegistrationSuccess() {
        let alert = UIAlertController(
            title: "회원가입 성공",
            message: "로그인 화면으로 돌아갑니다.",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "확인", style: .default) { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

#if DEBUG
import SwiftUI

#Preview {
    RegisterViewController().toPreview()
}
#endif
