//
//  LiveTableViewCell.swift
//  ZHIBO
//
//  Created by Shelton Lee on 2017/8/10.
//  Copyright © 2017年 Shelton Lee. All rights reserved.
//

import UIKit

class LiveTableViewCell: UITableViewCell {

    @IBOutlet weak var imgBigPor: UIImageView!
    @IBOutlet weak var imgPor: UIImageView!
    @IBOutlet weak var labelViewers: UILabel!
    @IBOutlet weak var labelAddr: UILabel!
    @IBOutlet weak var labelNick: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
