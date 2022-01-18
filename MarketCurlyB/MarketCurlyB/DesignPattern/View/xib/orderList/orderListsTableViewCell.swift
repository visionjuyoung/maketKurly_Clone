//
//  orderListsTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import UIKit

class orderListsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var orderNumLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var howtoLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
