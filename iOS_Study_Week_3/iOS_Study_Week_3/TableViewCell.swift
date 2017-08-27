//
//  TableViewCell.swift
//  iOS_Study_Week_3
//
//  Created by 권병수 on 2017. 8. 28..
//  Copyright © 2017년 stack. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
	
	@IBOutlet weak var cellLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
