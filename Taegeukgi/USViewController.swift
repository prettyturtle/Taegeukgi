//
//  USViewController.swift
//  Taegeukgi
//
//  Created by yc on 8/19/24.
//

import UIKit
import SnapKit
import Then

final class USViewController: UIViewController {
	
	private lazy var backgroundView = USBackgroundView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .black
		navigationController?.navigationBar.topItem?.backButtonTitle = ""
		
		setupLayout(for: traitCollection)
	}
	
	override func viewWillTransition(
		to size: CGSize,
		with coordinator: UIViewControllerTransitionCoordinator
	) {
		super.viewWillTransition(to: size, with: coordinator)
		
		coordinator.animate(
			alongsideTransition: { [weak self] _ in
				guard let self = self else {
					return
				}
				
				updateLayout(for: traitCollection)
			},
			completion: nil
		)
	}
	
	private func setupLayout(for traitCollection: UITraitCollection) {
		view.addSubview(backgroundView)
		
		if traitCollection.verticalSizeClass == .compact {
			setupLandscapeLayout()
		} else {
			setupPortraitLayout()
		}
	}
	
	private func updateLayout(for traitCollection: UITraitCollection) {
		if traitCollection.verticalSizeClass == .compact {
			updateLandscapeLayout()
		} else {
			updatePortraitLayout()
		}
	}
	
	private func setupPortraitLayout() {
		backgroundView.snp.makeConstraints {
			$0.leading.trailing.equalToSuperview()
			$0.height.equalTo(backgroundView.snp.width).multipliedBy(1.0 / 1.9)
			$0.center.equalToSuperview()
		}
	}
	
	private func setupLandscapeLayout() {
		backgroundView.snp.makeConstraints {
			$0.top.bottom.equalToSuperview()
			$0.width.equalTo(backgroundView.snp.height).multipliedBy(1.9 / 1.0)
			$0.center.equalToSuperview()
		}
	}
	
	private func updatePortraitLayout() {
		backgroundView.snp.removeConstraints()
		
		setupPortraitLayout()
	}
	
	private func updateLandscapeLayout() {
		backgroundView.snp.removeConstraints()
		
		setupLandscapeLayout()
	}
}
