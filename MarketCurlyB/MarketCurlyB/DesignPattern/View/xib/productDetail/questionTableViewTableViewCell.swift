//
//  questionTableViewTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/16.
//

import UIKit

class questionTableViewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var questionName: UILabel!
    @IBOutlet weak var questionDate: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
