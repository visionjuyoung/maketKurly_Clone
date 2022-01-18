//
//  totalpriceTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import UIKit

class totalpriceTableViewCell: UITableViewCell {

    @IBOutlet weak var qwe: UILabel!
    @IBOutlet weak var pricelab: UILabel!
    @IBOutlet weak var totalPriceLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        qwe.layer.cornerRadius = 2
        qwe.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
