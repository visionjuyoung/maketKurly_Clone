//
//  orderSixTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import UIKit

class orderSixTableViewCell: UITableViewCell {

    @IBOutlet weak var orderPayLabel: UILabel!
    @IBOutlet weak var orderpayLabel2: UILabel!
    @IBOutlet weak var totalPayLabel: UILabel!
    @IBOutlet weak var fff: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        fff.layer.cornerRadius = 8
        fff.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
