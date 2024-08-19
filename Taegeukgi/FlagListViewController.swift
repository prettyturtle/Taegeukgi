//
//  FlagListViewController.swift
//  Taegeukgi
//
//  Created by yc on 8/19/24.
//

import UIKit
import SnapKit
import Then

final class FlagListViewController: UIViewController {
	
	private let countryList = Country.allCases
	
	private lazy var countryTableView = UITableView().then {
		$0.dataSource = self
		$0.delegate = self
		$0.register(
			UITableViewCell.self,
			forCellReuseIdentifier: "CoutryTableViewCell"
		)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupLayout()
		setupNavBar()
	}
}

extension FlagListViewController: UITableViewDataSource {
	func tableView(
		_ tableView: UITableView,
		numberOfRowsInSection section: Int
	) -> Int {
		return countryList.count
	}
	
	func tableView(
		_ tableView: UITableView,
		cellForRowAt indexPath: IndexPath
	) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(
			withIdentifier: "CoutryTableViewCell",
			for: indexPath
		)
		
		cell.textLabel?.text = countryList[indexPath.row].rawValue
		
		return cell
	}
}

extension FlagListViewController: UITableViewDelegate {
	func tableView(
		_ tableView: UITableView,
		didSelectRowAt indexPath: IndexPath
	) {
		
		tableView.deselectRow(at: indexPath, animated: true)
		
		let country = countryList[indexPath.row]
		
		navigationController?.pushViewController(country.vc, animated: true)
	}
}

private extension FlagListViewController {
	func setupLayout() {
		view.addSubview(countryTableView)
		
		countryTableView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
	}
	
	func setupNavBar() {
		navigationItem.title = "국가 선택"
	}
}

enum Country: String, CaseIterable {
	case korea	= "한국"
	case us		= "미국"
	
	var vc: UIViewController {
		switch self {
		case .korea:
			return KoreaViewController()
		case .us:
			return USViewController()
		}
	}
}
