//
//  productReviewsTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/16.
//

import UIKit

class productReviewsTableViewCell: UITableViewCell {

    @IBOutlet weak var notionLabel3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        notionLabel3.layer.cornerRadius = 8
        notionLabel3.layer.borderWidth = 1
        notionLabel3.layer.borderColor = UIColor.purple.cgColor
        notionLabel3.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
