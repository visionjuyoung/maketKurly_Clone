//
//  questionTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/16.
//

import UIKit

class questionTableViewCell: UITableViewCell {

    @IBOutlet weak var anotionLabel1: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        anotionLabel1.layer.cornerRadius = 5
        anotionLabel1.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
