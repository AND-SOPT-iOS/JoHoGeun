//
//  AppMainViewController.swift
//  35-Seminar
//
//  Created by 조호근 on 10/21/24.
//

import UIKit
import SnapKit

final class AppMainViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let headerView = AppHeaderView()
    private let ratingView = AppRatingView()
    private let newUpdateView = AppNewUpdateView()
    private let previewView = AppPreviewView()
    private let infoAndDeveloperView = AppInfoAndDeveloperView()
    private let ratingAndReviewView = AppRatingAndReviewView()
    private let reviewView = AppReviewView()
    private let toastView = ToastView()
    
    private let navigationIconView = UIImageView()
    
    private lazy var updateButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setNavigationBar()
        setDelegates()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        headerView.configure(title: "토스", subtitle: "금융이 쉬워진다", image: UIImage(named: "toss"))
        
        navigationIconView.image = UIImage(named: "toss")
        navigationIconView.contentMode = .scaleAspectFit
        navigationIconView.layer.cornerRadius = 12
        navigationIconView.clipsToBounds = true
        
        updateButton.configuration = {
            var config = UIButton.Configuration.filled()
            config.title = "열기"
            config.cornerStyle = .capsule
            config.baseForegroundColor = .white

            return config
        }()
    }
    
    private func setUI() {
        view.addSubviews(scrollView, toastView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            headerView,
            ratingView,
            newUpdateView,
            previewView,
            infoAndDeveloperView,
            ratingAndReviewView,
            reviewView
        )
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.top.bottom.equalTo(scrollView.contentLayoutGuide)
            $0.leading.trailing.equalTo(scrollView.frameLayoutGuide).inset(20)
            $0.width.equalTo(scrollView.frameLayoutGuide).inset(20)
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(140)
        }
        
        ratingView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        newUpdateView.snp.makeConstraints {
            $0.top.equalTo(ratingView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        previewView.snp.makeConstraints {
            $0.top.equalTo(newUpdateView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview()
        }
        
        infoAndDeveloperView.snp.makeConstraints {
            $0.top.equalTo(previewView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
        
        ratingAndReviewView.snp.makeConstraints {
            $0.top.equalTo(infoAndDeveloperView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
        
        reviewView.snp.makeConstraints {
            $0.top.equalTo(ratingAndReviewView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20)
        }
        
        toastView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(200)
        }
        
        navigationIconView.snp.makeConstraints {
            $0.size.equalTo(40)
        }
    }
    
    private func setNavigationBar() {
        navigationItem.titleView = navigationIconView
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: updateButton)
    }
    
    private func setDelegates() {
        scrollView.delegate = self
        headerView.delegate = self
        newUpdateView.delegate = self
        infoAndDeveloperView.delegate = self
        ratingAndReviewView.delegate = self
        reviewView.delegate = self
    }
}

// MARK: - Delegate

extension AppMainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let threshold: CGFloat = 100
        
        if offset > threshold {
            navigationController?.setNavigationBarHidden(false, animated: true)
            
            let alpha = min(1, max(0, (offset - threshold) / 50))
            navigationIconView.alpha = alpha
            updateButton.alpha = alpha
        } else {
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }
}

extension AppMainViewController: AppHeaderViewDelegate {
    func openButtonTapped() {
        // TODO: 열기버튼
    }
    
    func shareButtonTapped() {
        // TODO: 공유버튼
    }
}

extension AppMainViewController: AppNewUpdateViewDelegate {
    func versionHistoryButtonTapped() {
        let versionHistoryVC = AppDetailViewController()
        versionHistoryVC.configure(title: "버전 기록")
        
        navigationController?.pushViewController(versionHistoryVC, animated: true)
    }
}

extension AppMainViewController: AppInfoAndDeveloperViewDelegate {
    func developerButtonTapped() {
        // TODO: 개발자 버튼
    }
}

extension AppMainViewController: AppRatingAndReviewViewProtocol {
    func ratingAndReviewTapped() {
        let ratingAndReviewVC = AppDetailViewController()
        ratingAndReviewVC.configure(title: "모두 보기")
        
        navigationController?.pushViewController(ratingAndReviewVC, animated: true)
    }
}

extension AppMainViewController: AppReviewViewDelegate {
    func starButtonTapped() {
        toastView.show(message: "피드백을 보내주셔서 감사합니다.")
    }
    
    func submitButtonTapped() {
        let reviewWriteVC = AppDetailViewController()
        reviewWriteVC.configure(title: "리뷰 작성")
        
        navigationController?.pushViewController(reviewWriteVC, animated: true)
    }
}

#if DEBUG
import SwiftUI

#Preview {
    AppMainViewController().toPreview()
}

#endif
