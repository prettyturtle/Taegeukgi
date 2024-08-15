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
		let rootViewController = ViewController()
		window?.rootViewController = rootViewController
		window?.makeKeyAndVisible()
		
	}
}
