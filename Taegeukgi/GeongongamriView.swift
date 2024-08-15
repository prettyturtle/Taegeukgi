//
//  GeongongamriView.swift
//  Taegeukgi
//
//  Created by yc on 8/15/24.
//

import UIKit
import SnapKit
import Then

final class GeongongamriView: UIView {
	
	private lazy var barStackView = UIStackView().then { stv in
		
		stv.axis = .horizontal
		stv.distribution = .fillEqually
		
		for barCnt in type.barCntList {
			
			let barRowStackView = UIStackView().then {
				$0.axis = .vertical
				$0.distribution = .fillEqually
			}
			
			for i in 0..<barCnt {
				let barView = UIView().then {
					$0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
				}
				
				barRowStackView.addArrangedSubview(barView)
			}
			
			stv.addArrangedSubview(barRowStackView)
		}
	}
	
	private let type: Geongongamri
	
	init(type: Geongongamri) {
		self.type = type
		
		super.init(frame: .zero)
		
		setupLayout()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		barStackView.spacing = frame.width / 8.0
		
		barStackView.arrangedSubviews.forEach { subView in
			
			guard let barRowStackView = subView as? UIStackView else {
				return
			}
			
			barRowStackView.spacing = frame.width / 8.0
		}
	}
	
	private func setupLayout() {
		[
			barStackView
		].forEach {
			addSubview($0)
		}
		
		barStackView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
	}
}
