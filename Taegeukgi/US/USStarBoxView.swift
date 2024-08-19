//
//  USStarBoxView.swift
//  Taegeukgi
//
//  Created by yc on 8/19/24.
//

import UIKit
import SnapKit
import Then

final class USStarBoxView: UIView {
	
	private lazy var starTotalStackView = UIStackView().then {
		$0.axis = .vertical
		$0.distribution = .equalCentering
		$0.alignment = .center
	}
	
	private var starViewList = [USStarView]()
	
	init() {
		super.init(frame: .zero)
		backgroundColor = .init(hex: "#002664")
		
//		makeStarStackView()
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
//	override func layoutSubviews() {
//		super.layoutSubviews()
//		
//		
//		print(frame)
//		
//		starTotalStackView.spacing = frame.height / 10.0
//		
//		starTotalStackView.arrangedSubviews.forEach { starStackView in
//			guard let starStackView = starStackView as? UIStackView else {
//				return
//			}
//			
//			starStackView.spacing = frame.width / 12.0
//			
//			starStackView.arrangedSubviews.forEach { starView in
//				guard let starView = starView as? USStarView else {
//					return
//				}
//				
//				starView.snp.makeConstraints {
//					$0.size.equalTo(snp.height).multipliedBy(4.0 / 35.0)
//				}
//			}
//		}
//	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		let starSize = frame.height * 4.0 / 35.0
		let horGap = frame.width / 12.0
		let verGap = frame.height / 10.0
		
		starViewList.forEach {
			$0.removeFromSuperview()
		}
		
		starViewList = []
		
		for i in 1...50 {
			
			let starView = USStarView()
			
			starViewList.append(starView)
		}
		
		for i in 0..<50 {
			
			let starView = starViewList[i]
			
			addSubview(starView)
			
			starView.snp.makeConstraints {
				$0.size.equalTo(starSize)
			}
			
			if i == 0 {
				
				starView.snp.makeConstraints {
					$0.centerX.equalTo(snp.leading).inset(horGap)
					$0.centerY.equalTo(snp.top).offset(verGap)
				}
				
			} else if i == 6 || i == 17 || i == 28 || i == 39 {
				
				let prevStarView = starViewList[i - 1]
				
				starView.snp.makeConstraints {
					$0.centerX.equalTo(snp.leading).inset(horGap * 2)
					$0.centerY.equalTo(prevStarView.snp.centerY).offset(verGap)
				}
				
			} else if i == 11 || i == 22 || i == 33 || i == 44 {
				
				let prevStarView = starViewList[i - 1]
				
				starView.snp.makeConstraints {
					$0.centerX.equalTo(snp.leading).inset(horGap)
					$0.centerY.equalTo(prevStarView.snp.centerY).offset(verGap)
				}
				
			} else {
				
				let prevStarView = starViewList[i - 1]
				
				starView.snp.makeConstraints {
					$0.centerY.equalTo(prevStarView.snp.centerY)
					$0.centerX.equalTo(prevStarView.snp.centerX).offset(horGap * 2)
				}
				
			}
		}
	}
	
	private func makeStarStackView() {
		
		for i in 1...9 {
			
			let starStackView = UIStackView().then {
				$0.axis = .horizontal
				$0.distribution = .equalCentering
			}
			
			let starCount = i % 2 == 0 ? 5 : 6
			
			for _ in 0..<starCount {
				let starView = USStarView()
				starStackView.addArrangedSubview(starView)
				starViewList.append(starView)
			}
			
			starTotalStackView.addArrangedSubview(starStackView)
			
		}
		
	}
	
	private func setupLayout() {
//		[
//			starTotalStackView
//		].forEach {
//			addSubview($0)
//		}
//		
//		starTotalStackView.snp.makeConstraints {
//			$0.center.equalToSuperview()
//		}
		
		
	}
}
