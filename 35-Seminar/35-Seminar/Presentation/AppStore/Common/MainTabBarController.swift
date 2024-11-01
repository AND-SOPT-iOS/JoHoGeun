//
//  MainTabBarController.swift
//  35-Seminar
//
//  Created by 조호근 on 11/1/24.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let todayVC = configureNavigationController(
            with: configureDetailVC(title: "투데이"),
            title: "투데이",
            image: "doc.text.image",
            selectedImage: "doc.text.image.fill"
        )
        
        let gameVC = configureNavigationController(
            with: configureDetailVC(title: "게임"),
            title: "게임",
            image: "gamecontroller",
            selectedImage: "gamecontroller.fill"
        )
        
        let appVC = configureNavigationController(
            with: AppStoreViewController(),
            title: "금융",
            image: "square.stack.3d.up",
            selectedImage: "square.stack.3d.up.fill"
        )
        
        let arcadeVC = configureNavigationController(
            with: configureDetailVC(title: "아케이드"),
            title: "아케이드",
            image: "arcade.stick",
            selectedImage: "arcade.stick.console"
        )
        
        let searchVC = configureNavigationController(
            with: configureDetailVC(title: "검색"),
            title: "검색",
            image: "magnifyingglass",
            selectedImage: "magnifyingglass"
        )
        
        self.viewControllers = [todayVC, gameVC, appVC, arcadeVC, searchVC]
        
        self.tabBar.tintColor = .systemBlue
        self.tabBar.backgroundColor = .systemBackground
    }
    
    private func configureDetailVC(title: String) -> UIViewController {
        let detailVC = AppDetailViewController()
        detailVC.configure(title: title)
        return detailVC
    }
    
    private func configureNavigationController(
        with rootViewController: UIViewController,
        title: String,
        image: String,
        selectedImage: String
    ) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem = UITabBarItem(
            title: title,
            image: UIImage(systemName: image),
            selectedImage: UIImage(systemName: selectedImage)
        )
        rootViewController.title = title
        return navigationController
    }
    
}
