//
//  MainViewController.swift
//  35-Seminar
//
//  Created by 조호근 on 10/21/24.
//

import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    private let appInfoView = AppInfoAndDeveloperView()
    
    override func viewDidLoad() {
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.addSubview(appInfoView)
    }
    
    private func setLayout() {
        appInfoView.snp.makeConstraints {
            $0.size.equalToSuperview()
        }
    }
}
