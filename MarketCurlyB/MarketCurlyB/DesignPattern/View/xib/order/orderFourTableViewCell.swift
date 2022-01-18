//
//  orderFourTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import UIKit

class orderFourTableViewCell: UITableViewCell {

    @IBOutlet weak var button1: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.systemGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
