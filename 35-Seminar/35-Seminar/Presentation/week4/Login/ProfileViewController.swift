//
//  ProfileViewController.swift
//  35-Seminar
//
//  Created by 조호근 on 11/8/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let userService: UserHandler = UserService.shared
    private let authManager: AuthManager = .shared
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "환영합니다, "
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        
        return label
    }()
    
    private let hobbyLabel: UILabel = {
        let label = UILabel()
        label.text = "당신의 취미는 "
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        
        return label
    }()
    
    private let updateHobbyButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .systemBlue
        
        let attributes = AttributeContainer([
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold)
        ])
        config.attributedTitle = AttributedString("취미 변경", attributes: attributes)
        
        button.configuration = config
        
        return button
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .capsule
        config.baseForegroundColor = .white
        config.baseBackgroundColor = .systemRed
        
        let attributes = AttributeContainer([
            .font: UIFont.systemFont(ofSize: 18, weight: .semibold)
        ])
        config.attributedTitle = AttributedString("로그아웃", attributes: attributes)
        
        button.configuration = config
        
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchHobby()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
        setAction()
    }
    
    private func setStyle() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "로그인 완료"
    }
    
    private func setUI() {
        view.addSubviews(
            welcomeLabel,
            hobbyLabel,
            updateHobbyButton,
            logoutButton
        )
    }
    
    private func setLayout() {
        welcomeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        hobbyLabel.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        updateHobbyButton.snp.makeConstraints {
            $0.top.equalTo(hobbyLabel.snp.bottom).offset(60)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        logoutButton.snp.makeConstraints {
            $0.top.equalTo(updateHobbyButton.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    private func setAction() {
        let logoutAction = UIAction { [weak self] _ in
            self?.logoutButtonTapped()
        }
        logoutButton.addAction(logoutAction, for: .touchUpInside)
        
        let updateHobbyAction = UIAction { [weak self] _ in
            self?.updateHobbyButtonTapped()
        }
        updateHobbyButton.addAction(updateHobbyAction, for: .touchUpInside)
    }
    
    private func logoutButtonTapped() {
        authManager.logout()
        let loginVC = LoginViewController()
        navigationController?.setViewControllers([loginVC], animated: true)
    }
    
    private func updateHobbyButtonTapped() {
        let alert = UIAlertController(title: "취미 변경", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "새로운 취미를 입력하세요"
        }
        
        let confirmAction = UIAlertAction(title: "확인", style: .default) { [weak self] _ in
            guard let hobby = alert.textFields?.first?.text else { return }
            self?.updateHobby(hobby: hobby)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    private func updateHobby(hobby: String) {
        userService.updateUser(hobby: hobby, password: "") { [weak self] result in
            switch result {
            case .success:
                self?.fetchHobby()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchHobby() {
        userService.getMyHobby { [weak self] result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.hobbyLabel.text = "당신의 취미는 \(response.result.hobby)"
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

extension ProfileViewController {
    
    func configure(with username: String) {
        welcomeLabel.text = "환영합니다, \(username)님!"
    }
    
}

#if DEBUG
import SwiftUI

#Preview {
    ProfileViewController().toPreview()
}
#endif
