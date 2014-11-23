//
//  MyViewCell.swift
//  WhatToEatNow
//
//  Created by 崔宇 on 14/11/22.
//  Copyright (c) 2014年 cuiyu. All rights reserved.
//

import UIKit

class MyViewCell: UITableViewCell {

    @IBOutlet weak var imageViewForEachCell: UIImageView!
    @IBOutlet var textLableForEachCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
