//
//  USStarView.swift
//  Taegeukgi
//
//  Created by yc on 8/19/24.
//

import UIKit
import SnapKit
import Then

final class USStarView: UIView {
	override func draw(_ rect: CGRect) {
		
		guard let context = UIGraphicsGetCurrentContext() else { return }
		
		context.setFillColor(UIColor(hex: "#002664").cgColor)
		context.fill(rect)
		
		let radius = frame.width / 2.0
		
		let center = CGPoint(x: rect.midX, y: rect.midY)
		
		let numberOfPoints = 5
		
		let angleIncrement = CGFloat.pi * 2.0 / CGFloat(numberOfPoints) // 72
		let startAngle = -CGFloat.pi / 2.0								// -90
		
		context.move(
			to: CGPoint(
				x: center.x + radius * cos(startAngle),
				y: center.y + radius * sin(startAngle)
			)
		)
		
		for i in 1...numberOfPoints * 2 {
			let angle = startAngle + angleIncrement * CGFloat(i)
			let nextRadius = i % 2 == 0 ? radius : radius / 2.5
			let point = CGPoint(x: center.x + nextRadius * cos(angle), y: center.y + nextRadius * sin(angle))
			context.addLine(to: point)
		}
		
		context.closePath()
		
		UIColor(hex: "#FFFFFF").setFill()
		context.fillPath()
	}
}
