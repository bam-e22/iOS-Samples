//
//  ViewController.swift
//  iOS_Study_Week_4
//
//  Created by 권병수 on 2017. 9. 2..
//  Copyright © 2017년 stack. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var editTextField: UITextField!
	
	let CELL_ID_SEND = "cellSend"
	let CELL_ID_RECV = "cellRecv"
	
	var dataList = [Data]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		dataList.append(DataRecv(nickname: "John", text: "Hi"))
		dataList.append(DataRecv(nickname: "John", text: "I'm John"))
		dataList.append(DataSend(text: "Hello"))
	}

	/*
	 * Send Button Listener
	 */
	
	@IBAction func sendButton(_ sender: Any) {
		
		let text = editTextField.text!
		
		if text.characters.count == 0 {
			
			print("textField text 0")
		} else {
			
			dataList.append(DataSend(text:text))
			editTextField.text = ""
			tableView.reloadData()
		}
	}

	/*
	 * Table View
	 */
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return dataList.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let data = dataList[indexPath.row]
		
		let cellID = (data is DataSend) ? CELL_ID_SEND : CELL_ID_RECV
		
		let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
		
		switch cellID {
		
		case CELL_ID_SEND:
			let dataSend = data as! DataSend
			let cellSend = cell as! UITableVIewCellSend
			
			cellSend.sendMsg.text = dataSend.text
			
		case CELL_ID_RECV:
			
			let dataRecv = data as! DataRecv
			let cellRecv = cell as! UITableVIewCellRecv
			
			cellRecv.recvMsg.text = dataRecv.text
			cellRecv.senderLabel.text = dataRecv.nickname
			
		default: break
		}
		
		return cell
	}
}


// Data
protocol Data {
	
	var text: String? {get set}
}

class DataSend : Data {
	
	var text:String?
	
	init(text: String) {
		
		self.text = text
	}
}

class DataRecv: Data {
	
	var nickname: String
	var text: String?
	
	init(nickname:String, text:String) {
		
		self.nickname = nickname
		self.text = text
	}
}

// Cell Class
class UITableVIewCellSend: UITableViewCell {
	
	
	@IBOutlet weak var sendMsg: UILabel!
}

class UITableVIewCellRecv: UITableViewCell {
	
	@IBOutlet weak var recvMsg: UILabel!
	@IBOutlet weak var senderLabel: UILabel!
}
