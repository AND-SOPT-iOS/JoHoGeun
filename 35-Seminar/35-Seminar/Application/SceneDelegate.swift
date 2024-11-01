//
//  SceneDelegate.swift
//  35-Seminar
//
//  Created by 조호근 on 10/5/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    self.window = UIWindow(windowScene: windowScene)
    let navigationController = UINavigationController(rootViewController: AppStoreViewController())
    self.window?.rootViewController = navigationController
    self.window?.makeKeyAndVisible()
  }
}
