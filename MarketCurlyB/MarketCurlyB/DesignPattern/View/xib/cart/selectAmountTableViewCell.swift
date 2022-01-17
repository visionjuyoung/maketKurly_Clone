//
//  selectAmountTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/17.
//

import UIKit

class selectAmountTableViewCell: UITableViewCell {
    
    let dataman = ProductViewState.shared
    
    var count: Int = 0
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var namesLab: UILabel!
    @IBOutlet weak var priceLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func asd(_ sender: Any) {
        count += 1
        amountLabel.text = "\(count)"
        dataman.amount = count
    }
    
    @IBAction func minusbutton(_ sender: Any) {
        count -= 1
        amountLabel.text = "\(count)"
        dataman.amount = count
    }
}
