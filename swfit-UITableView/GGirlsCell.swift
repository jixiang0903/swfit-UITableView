//
//  GGirlsCell.swift
//  swfit-UITableView
//
//  Created by 吉祥 on 2017/8/15.
//  Copyright © 2017年 jixiang. All rights reserved.
//

import UIKit

class GGirlsCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var girlImage: UIImageView!
    //xib 初始化
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
