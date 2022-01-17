//
//  productExplainTwoTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/17.
//

import UIKit

class productExplainTwoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    @IBOutlet weak var packTypeLabel: UILabel!
    @IBOutlet weak var notionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
