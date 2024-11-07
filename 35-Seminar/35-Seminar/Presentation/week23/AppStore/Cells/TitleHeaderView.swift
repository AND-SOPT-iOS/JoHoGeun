//
//  TitleHeaderView.swift
//  35-Seminar
//
//  Created by 조호근 on 11/1/24.
//

import UIKit
import SnapKit

protocol TitleHeaderViewDelegate: AnyObject {
    func moreButtonTapped(in section: Int)
}

final class TitleHeaderView: UICollectionReusableView {
    
    static let identifier = "TitleHeaderView"
    
    weak var delegate: TitleHeaderViewDelegate?
    private var section: Int?
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = . systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.isHidden = true
        
        return label
    }()
    
    private let moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("모두 보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
        setAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    
    private func setUI() {
        self.addSubviews(
            separatorView,
            titleLabel,
            subtitleLabel,
            moreButton
        )
    }
    
    private func setLayout() {
        separatorView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom).offset(16)
            $0.leading.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.top)
            $0.trailing.equalToSuperview().inset(4)
        }
    }
    
    private func setAction() {
        moreButton.addAction (
            UIAction { [weak self] _ in
                guard let self,
                      let section = self.section else { return }
                self.delegate?.moreButtonTapped(in: section)
            },
            for: .touchUpInside
        )
    }
    
    func configure(
        title: String,
        subtitle: String? = nil,
        section: Int
    ) {
        self.section = section
        titleLabel.text = title
        
        if let subtitle = subtitle {
            subtitleLabel.text = subtitle
            subtitleLabel.isHidden = false
        }
    }
    
}
