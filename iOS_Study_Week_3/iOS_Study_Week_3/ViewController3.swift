//
//  ViewController3.swift
//  iOS_Study_Week_3
//
//  Created by 권병수 on 2017. 8. 28..
//  Copyright © 2017년 stack. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

	@IBOutlet weak var label: UILabel!
	
	var testId : Int? = nil
	
	let UNWIND_SEGUE_3_TO_MAIN = "unWindSegue3ToMain"
	
    override func viewDidLoad() {
        super.viewDidLoad()

		print(testId ?? "nil")
		
		registerViewClickListener(label, selector: #selector(labelOnClick(_:)))
    }
	
	func labelOnClick(_ sender: UITapGestureRecognizer) {
		
		performSegue(withIdentifier: UNWIND_SEGUE_3_TO_MAIN, sender: self)
	}
}
