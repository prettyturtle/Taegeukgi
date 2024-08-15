//
//  BackgroundView.swift
//  Taegeukgi
//
//  Created by yc on 8/14/24.
//

import UIKit
import SnapKit
import Then

final class BackgroundView: UIView {
	
	private lazy var circleView = CircleView().then {
		$0.transform = .init(rotationAngle: atan(2.0 / 3.0))
	}
	
	private lazy var geongonView = GeongongamriWrapView(leftType: .geon, rightType: .gon).then {
		$0.transform = .init(rotationAngle: atan(2.0 / 3.0))
	}
	
	private lazy var gamriView = GeongongamriWrapView(leftType: .ri, rightType: .gam).then {
		$0.transform = .init(rotationAngle: -atan(2.0 / 3.0))
	}
	
	init() {
		super.init(frame: .zero)
		
		backgroundColor = .white
		
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupLayout() {
		[
			circleView,
			geongonView,
			gamriView
		].forEach {
			addSubview($0)
		}
		
		circleView.snp.makeConstraints {
			$0.size.equalTo(snp.width).dividedBy(3.0)
			$0.center.equalToSuperview()
		}
		
		geongonView.snp.makeConstraints {
			$0.height.equalTo(snp.width).dividedBy(3.0)
			$0.center.equalToSuperview()
		}
		
		gamriView.snp.makeConstraints {
			$0.height.equalTo(snp.width).dividedBy(3.0)
			$0.center.equalToSuperview()
		}
	}
}
