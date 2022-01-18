//
//  oftensTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import UIKit

class oftensTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productimage: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var num: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
