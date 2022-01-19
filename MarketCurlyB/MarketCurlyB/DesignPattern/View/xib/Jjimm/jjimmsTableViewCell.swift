//
//  jjimmsTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/19.
//

import UIKit

class jjimmsTableViewCell: UITableViewCell {

    let state = LoginState.shared
    let productInfo = ProductViewState.shared

    @IBOutlet weak var productImages: UIImageView!
    @IBOutlet weak var productNames: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    var productIdx: Int = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.systemGray4.cgColor
        button1.layer.cornerRadius = 3
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.purple.cgColor
        button2.layer.cornerRadius = 3
        print(productIdx)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        productIdx = 0
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func deleteHeart(_ sender: Any) {
        print(productIdx)
        productInfo.deleteHeartProductNum = productIdx
    }
}
