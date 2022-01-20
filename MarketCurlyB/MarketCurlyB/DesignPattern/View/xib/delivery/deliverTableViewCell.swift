//
//  deliverTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/19.
//

import UIKit

class deliverTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var isDefault = ""
    var deliveryInfoIdx = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("------------")
        print(isDefault)
        print(deliveryInfoIdx)
        print("------------")
    }
    
    override func prepareForReuse() {
        isDefault = ""
        deliveryInfoIdx = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
