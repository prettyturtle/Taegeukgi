//
//  Geongongamri.swift
//  Taegeukgi
//
//  Created by yc on 8/15/24.
//

import Foundation

enum Geongongamri {
	case geon
	case gon
	case gam
	case ri
	
	var barCntList: Array<Int> {
		switch self {
		case .geon:
			return [1, 1, 1]
		case .gon:
			return [2, 2, 2]
		case .gam:
			return [2, 1, 2]
		case .ri:
			return [1, 2, 1]
		}
	}
}
