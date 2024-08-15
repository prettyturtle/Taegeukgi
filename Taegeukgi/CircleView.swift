//
//  CircleView.swift
//  Taegeukgi
//
//  Created by yc on 8/14/24.
//

import UIKit
import SnapKit
import Then

final class CircleView: UIView {
	
	private let redColor = UIColor(red: 198 / 255, green: 12 / 255, blue: 48 / 255, alpha: 1.0)
	private let blueColor = UIColor(red: 0 / 255, green: 52 / 255, blue: 120 / 255, alpha: 1.0)
	
	override func draw(_ rect: CGRect) {
		backgroundColor = .white
		layer.backgroundColor = UIColor.white.cgColor
				
		guard let context = UIGraphicsGetCurrentContext() else { return }
		
		// 배경색을 분홍색으로 설정
		context.setFillColor(UIColor.white.cgColor)
		context.fill(rect)
		
		// 반원의 중심점과 반지름을 계산
		let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
		let radius = min(rect.width, rect.height / 2)
		
		// 반원을 그리기 위한 시작점과 끝점을 정의
		let startAngle: CGFloat = .pi
		let endAngle: CGFloat = 0
		
		// 경로를 만들고 반원을 추가
		context.beginPath()
		context.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
		
		// 반원의 직선 부분을 채우기 위해 추가
		context.addLine(to: CGPoint(x: rect.width, y: rect.height / 2))
		context.closePath()
		
		// 경로를 채우기 위해 색상 설정
		context.setFillColor(redColor.cgColor)
		context.fillPath()
		
		// 반원의 중심점과 반지름을 계산
		let center2 = CGPoint(x: rect.width / 2, y: rect.height / 2)
		let radius2 = min(rect.width, rect.height / 2)
		
		// 반원을 그리기 위한 시작점과 끝점을 정의
		let startAngle2: CGFloat = 0
		let endAngle2: CGFloat = .pi
		
		// 경로를 만들고 반원을 추가
		context.beginPath()
		context.addArc(center: center2, radius: radius2, startAngle: startAngle2, endAngle: endAngle2, clockwise: false)
		
		// 반원의 직선 부분을 채우기 위해 추가
		context.addLine(to: CGPoint(x: rect.width, y: rect.height / 2))
		context.closePath()
		
		// 경로를 채우기 위해 색상 설정
		context.setFillColor(blueColor.cgColor)
		context.fillPath()
		
		// 반원의 중심점과 반지름을 계산
		let center3 = CGPoint(x: rect.width / 4, y: rect.height / 2)
		let radius3 = min(rect.width / 4, rect.height / 4)
		
		// 반원을 그리기 위한 시작점과 끝점을 정의
		let startAngle3: CGFloat = 0
		let endAngle3: CGFloat = 2 * .pi
		
		// 경로를 만들고 반원을 추가
		context.beginPath()
		context.addArc(center: center3, radius: radius3, startAngle: startAngle3, endAngle: endAngle3, clockwise: false)
		context.closePath()
		
		// 경로를 채우기 위해 색상 설정
		context.setFillColor(redColor.cgColor)
		context.fillPath()
		
		// 반원의 중심점과 반지름을 계산
		let center4 = CGPoint(x: rect.width / 4 * 3, y: rect.height / 2)
		let radius4 = min(rect.width / 4, rect.height / 4)
		
		// 반원을 그리기 위한 시작점과 끝점을 정의
		let startAngle4: CGFloat = 0
		let endAngle4: CGFloat = 2 * .pi
		
		// 경로를 만들고 반원을 추가
		context.beginPath()
		context.addArc(center: center4, radius: radius4, startAngle: startAngle4, endAngle: endAngle4, clockwise: false)
		context.closePath()
		
		// 경로를 채우기 위해 색상 설정
		context.setFillColor(blueColor.cgColor)
		context.fillPath()
		
		context.setLineWidth(0)
		context.strokePath()
	}
//	private lazy var redHalfCircleView = UIView().then {
//		$0.backgroundColor = .red
//		$0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//	}
//	
//	private lazy var redHalfCircleSubView = UIView().then {
//		$0.backgroundColor = .red
//	}
//	
//	private lazy var blueHalfCircleView = UIView().then {
//		$0.backgroundColor = .blue
//		$0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
//	}
//	
//	private lazy var blueHalfCircleSubView = UIView().then {
//		$0.backgroundColor = .blue
//	}
//	
//	init() {
//		super.init(frame: .zero)
//		
//		backgroundColor = .white
//		
//		setupLayout()
//	}
//	
//	required init?(coder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}
//	
//	override func layoutSubviews() {
//		super.layoutSubviews()
//		
//		redHalfCircleView.layer.cornerRadius = redHalfCircleView.frame.width / 2
//		blueHalfCircleView.layer.cornerRadius = blueHalfCircleView.frame.height
//		
//		redHalfCircleView.clipsToBounds = true
//	}
//	
//	private func setupLayout() {
//		[
//			redHalfCircleView,
////			redHalfCircleSubView,
//			blueHalfCircleView,
////			blueHalfCircleSubView
//		].forEach {
//			addSubview($0)
//		}
//		
//		redHalfCircleView.snp.makeConstraints {
//			$0.leading.top.trailing.equalToSuperview()
//			$0.bottom.equalTo(snp.centerY)
//		}
//		
//		blueHalfCircleView.snp.makeConstraints {
//			$0.leading.bottom.trailing.equalToSuperview()
//			$0.top.equalTo(snp.centerY)
//		}
//		
////		redHalfCircleView.autoSet
//		
////		if roundedView.layer.cornerRadius >= roundedView.frame.height / 2 {
////					roundedView.autoSetDimension(.height, toSize: roundedView.layer.cornerRadius * 2)
////				} else {
////					roundedView.autoPinEdge(toSuperviewEdge: .top)
////				}
//	}
}
