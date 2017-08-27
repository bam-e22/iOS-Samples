//
//  ViewController.swift
//  iOS_Study_Week_3
//
//  Created by 권병수 on 2017. 8. 28..
//  Copyright © 2017년 stack. All rights reserved.
//

import UIKit
import Toast_Swift

class ViewController: UITableViewController {
	
	let CELL_ID = "tableViewCell"
	let SEGUE_MAIN_TO_2 = "segueToView2"
	let SEGUE_MAIN_TO_3 = "segueToView3"

	override func viewDidLoad() {
		super.viewDidLoad()
		
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return 2
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath)
		
		if let defaultCell = cell as? TableViewCell {
			
			// Set Text
			defaultCell.cellLabel.text = String(indexPath.row + 1) + "번째 화면으로 이동하기"
			
			// Button이 아닌 View에 Click Listener 연결
			if indexPath.row == 0 {
				
				registerViewClickListener(defaultCell.cellLabel, selector: #selector(onCellLabelClick(_:)))
			} else if indexPath.row == 1 {
				
				registerViewClickListener(defaultCell.cellLabel, selector: #selector(onCellLabelClick2(_:)))
			}
		}
		
		return cell
	}
	
	func onCellLabelClick(_ sender: UITapGestureRecognizer) {
		
		performSegue(withIdentifier: SEGUE_MAIN_TO_2, sender: self)
	}
	
	func onCellLabelClick2(_ sender: UITapGestureRecognizer) {
		
		performSegue(withIdentifier: SEGUE_MAIN_TO_3, sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if segue.identifier == SEGUE_MAIN_TO_2 {
			
			let viewController2 = (segue.destination as! ViewController2)
			
			viewController2.testId = 22
		}
		
		if segue.identifier == SEGUE_MAIN_TO_3 {
			
			let viewController3 = (segue.destination as! ViewController3)
			
			viewController3.testId = 33
		}
	}
	
	@IBAction func unWindToMain(segue: UIStoryboardSegue) {
		
		if segue.source is ViewController2 {
			
			self.view.makeToast("1번쨰 화면 -> Main")
			
		} else if segue.source is ViewController3 {
			
			self.view.makeToast("2번쨰 화면 -> Main")
		}
	}
}

extension UIViewController {
	
	func registerViewClickListener(_ view: UIView, selector: Selector) {
		
		view.isUserInteractionEnabled = true
		view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: selector))
	}
}

