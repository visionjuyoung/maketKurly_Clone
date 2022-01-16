//
//  productReviewOneTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/16.
//

import UIKit

class productReviewOneTableViewCell: UITableViewCell {

    @IBOutlet weak var anotionLabel2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        anotionLabel2.layer.cornerRadius = 5
        anotionLabel2.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
