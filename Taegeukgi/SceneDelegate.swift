//
//  SceneDelegate.swift
//  Taegeukgi
//
//  Created by yc on 8/14/24.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	var window: UIWindow?
	
	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		
		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		window = UIWindow(windowScene: windowScene)
		window?.backgroundColor = .systemBackground
		window?.tintColor = .systemPink
		let rootViewController = FlagListViewController()
		window?.rootViewController = UINavigationController(rootViewController: rootViewController)
		window?.makeKeyAndVisible()
		
	}
}
