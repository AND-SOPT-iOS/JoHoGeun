//
//  DetailViewController.swift
//  35-Seminar
//
//  Created by 조호근 on 10/5/24.
//
// 1. TextField 띄우기
// 2. Button 띄우기

import UIKit

class DetailViewController: UIViewController {
    
    weak var delegate: NicknameDelegate?
    var completionHandler: ((String) -> ())?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "비어있음"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.placeholder = "텍스트 입력"
        return textField
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전 화면으로", for: .normal)
        button.backgroundColor = .tintColor
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var receivedTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        [
            titleLabel,
            textField,
            backButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.heightAnchor.constraint(equalToConstant: 44),
            textField.widthAnchor.constraint(equalToConstant: 300),
            
            
            backButton.topAnchor.constraint(
                equalTo: textField.bottomAnchor,
                constant: 50
            ),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            backButton.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    func dataBind(title: String) {
        self.receivedTitle = title
        updateUI()
    }
    
    private func updateUI() {
        self.titleLabel.text = receivedTitle
    }
    
    @objc func backButtonTapped() {
        if self.navigationController == nil {
            if let nickname = textField.text {
                completionHandler?(nickname)
            }
            self.dismiss(animated: true)
        } else {
            if let nickname = textField.text {
                delegate?.dataBind(nickname: nickname)
            }
            self.navigationController?.popViewController(animated: true)
        }
    }
}

#if DEBUG
import SwiftUI

#Preview {
    DetailViewController().toPreview()
}
#endif

