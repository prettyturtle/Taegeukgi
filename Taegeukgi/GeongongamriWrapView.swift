//
//  GeongongamriWrapView.swift
//  Taegeukgi
//
//  Created by yc on 8/15/24.
//

import UIKit
import SnapKit
import Then

final class GeongongamriWrapView: UIView {
	private lazy var leftView = GeongongamriView(type: leftType)
	private lazy var rightView = GeongongamriView(type: rightType)
	private lazy var centerView = UIView()
	
	private let leftType: Geongongamri
	private let rightType: Geongongamri
	
	init(leftType: Geongongamri, rightType: Geongongamri) {
		self.leftType = leftType
		self.rightType = rightType
		
		super.init(frame: .zero)
		
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		leftView.snp.updateConstraints {
			$0.trailing.equalTo(centerView.snp.leading).offset(-centerView.frame.height / 4.0)
		}
		
		rightView.snp.updateConstraints {
			$0.leading.equalTo(centerView.snp.trailing).offset(centerView.frame.height / 4.0)
		}
	}
	
	private func setupLayout() {
		[
			leftView,
			centerView,
			rightView,
		].forEach {
			addSubview($0)
		}
		
		centerView.snp.makeConstraints {
			$0.size.equalTo(snp.height)
			$0.center.equalToSuperview()
		}
		
		leftView.snp.makeConstraints {
			$0.trailing.equalTo(centerView.snp.leading)
			$0.centerY.equalToSuperview()
			$0.width.equalTo(centerView.snp.height).dividedBy(3.0)
			$0.height.equalTo(centerView.snp.height).dividedBy(2.0)
			$0.leading.equalToSuperview()
		}
		
		rightView.snp.makeConstraints {
			$0.leading.equalTo(centerView.snp.trailing)
			$0.centerY.equalToSuperview()
			$0.width.equalTo(centerView.snp.height).dividedBy(3.0)
			$0.height.equalTo(centerView.snp.height).dividedBy(2.0)
			$0.trailing.equalToSuperview()
		}
	}
}
