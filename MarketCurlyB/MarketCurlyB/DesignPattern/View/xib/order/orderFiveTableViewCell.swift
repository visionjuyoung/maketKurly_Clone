//
//  orderFiveTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import UIKit

class orderFiveTableViewCell: UITableViewCell {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.systemGray4.cgColor
        button1.layer.cornerRadius = 2
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.systemGray4.cgColor
        button2.layer.cornerRadius = 2
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.systemGray4.cgColor
        button3.layer.cornerRadius = 2
        checkButton.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
