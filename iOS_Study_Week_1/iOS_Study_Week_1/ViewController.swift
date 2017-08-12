//
//  ViewController.swift
//  iOS_Study_Week_1
//
//  Created by 권병수 on 2017. 8. 12..
//  Copyright © 2017년 stack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var input1: UITextField!
	@IBOutlet weak var input2: UITextField!
	@IBOutlet weak var resultLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		
	}

	@IBAction func onClick(_ sender: UIButton) {
		
		let val1 = input1.text!
		let val2 = input2.text!
		
		resultLabel.text = String(Int(val1)! + Int(val2)!)
	}
}

