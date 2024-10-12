//
//  ViewController.swift
//  35-Seminar
//
//  Created by 조호근 on 10/5/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "텍스트 입력"
        textField.textAlignment = .center
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 150, width: 200, height: 200))
        label.text = "네비게이션"
        label.textColor = .brown
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임: "
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 500, width: 100, height: 50))
        button.setTitle("다음", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var modeToggleButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 650, width: 100, height: 50))
        button.setTitle("모드전환", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.addTarget(self, action: #selector(switchButtonTapped), for: .valueChanged)
        return switchButton
    }()
    
    private let heartImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "heart.fill"))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .red
        imageView.isHidden = true
        return imageView
    }()
    
    private var pushMode: Bool = true
    private var nickname: String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [
            titleLabel,
            nicknameLabel,
            textField,
            nextButton,
            modeToggleButton,
            switchButton,
            heartImageView
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate(
            [
                textField.widthAnchor.constraint(equalToConstant: 300),
                textField.heightAnchor.constraint(equalToConstant: 40),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                
                nicknameLabel.widthAnchor.constraint(equalToConstant: 300),
                nicknameLabel.heightAnchor.constraint(equalToConstant: 40),
                nicknameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nicknameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
                
                textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                textField.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor, constant: 60),
                
                nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nextButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 60),
                nextButton.widthAnchor.constraint(equalToConstant: 100),
                
                modeToggleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                modeToggleButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 60),
                modeToggleButton.widthAnchor.constraint(equalToConstant: 100),
                
                switchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                switchButton.topAnchor.constraint(equalTo: modeToggleButton.bottomAnchor, constant: 60),
                
                heartImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                heartImageView.topAnchor.constraint(equalTo: switchButton.bottomAnchor, constant: 60),
                heartImageView.widthAnchor.constraint(equalToConstant: 50),
                heartImageView.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
    
    private func updateUI() {
        self.titleLabel.text = pushMode ? "네비게이션" : "모달"
    }
    
    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        nextViewController.delegate = self
        
        guard let title = textField.text else { return  }
        
        nextViewController.dataBind(title: title)
        nextViewController.completionHandler = { [weak self] nickname in
            self?.nicknameLabel.text = "Handler: " + nickname
        }
        
        if pushMode {
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            self.present(nextViewController, animated: true)
        }
    }
    
    @objc func nextButtonTapped() {
        transitionToNextViewController()
    }
    
    @objc func toggleButtonTapped() {
        self.pushMode.toggle()
        self.updateUI()
    }
    
    @objc func switchButtonTapped(_ sender: UISwitch) {
        if sender.isOn {
            heartImageView.isHidden = false
        } else {
            heartImageView.isHidden = true
        }
    }
}

extension ViewController: NicknameDelegate {
    func dataBind(nickname: String) {
        self.nickname = nickname
        nicknameLabel.text = "닉네임: " + self.nickname
    }
}

#if DEBUG
import SwiftUI

#Preview {
    NavigationStack {
        ViewController().toPreview()
    }
}
#endif
