//
//  USStripeView.swift
//  Taegeukgi
//
//  Created by yc on 8/19/24.
//

import UIKit
import SnapKit
import Then

final class USStripeView: UIView {
	init() {
		super.init(frame: .zero)
		backgroundColor = .init(hex: "#BF0A30")
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
