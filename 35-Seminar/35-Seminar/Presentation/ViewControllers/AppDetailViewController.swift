//
//  AppDetailViewController.swift
//  35-Seminar
//
//  Created by 조호근 on 10/23/24.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    private let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setStyle() {
        view.backgroundColor = .systemBackground
        
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private func setUI() {
        view.addSubviews(titleLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
