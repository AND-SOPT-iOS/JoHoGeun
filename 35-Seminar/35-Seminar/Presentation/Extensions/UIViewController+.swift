//
//  UIViewController+.swift
//  35-Seminar
//
//  Created by 조호근 on 11/8/24.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func showAlertForNetworkError(_ error: NetworkError) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(
                title: "오류",
                message: error.errorMessage,
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            self?.present(alert, animated: true)
        }
    }
    
}
