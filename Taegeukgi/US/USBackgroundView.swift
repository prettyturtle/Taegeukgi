//
//  USBackgroundView.swift
//  Taegeukgi
//
//  Created by yc on 8/19/24.
//

import UIKit
import SnapKit
import Then

final class USBackgroundView: UIView {
	
	private lazy var stripeStackView = UIStackView().then {
		$0.axis = .vertical
		$0.distribution = .equalSpacing
	}
	
	private lazy var starBoxView = USStarBoxView()
	
	init() {
		super.init(frame: .zero)
		
		backgroundColor = .white
		
		makeStripeView()
		
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func makeStripeView() {
		for _ in 0..<7 {
			
			let stripeView = USStripeView()
			
			stripeStackView.addArrangedSubview(stripeView)
			
			stripeView.snp.makeConstraints {
				$0.height.equalToSuperview().dividedBy(13.0)
			}
		}
	}
	
	private func setupLayout() {
		
		[
			stripeStackView,
			starBoxView
		].forEach {
			addSubview($0)
		}
		
		stripeStackView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
		
		starBoxView.snp.makeConstraints {
			$0.leading.top.equalToSuperview()
			$0.width.equalToSuperview().multipliedBy(2.0 / 5.0)
			$0.height.equalToSuperview().multipliedBy(7.0 / 13.0)
		}
	}
}
