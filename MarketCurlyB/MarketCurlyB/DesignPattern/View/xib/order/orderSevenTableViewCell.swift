//
//  orderSevenTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import UIKit

class orderSevenTableViewCell: UITableViewCell {

    @IBOutlet weak var checkbutton: UIButton!
    @IBOutlet weak var orderButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checkbutton.layer.cornerRadius = 15
        checkbutton.layer.borderWidth = 1
        checkbutton.layer.borderColor = UIColor.systemGray4.cgColor
        orderButton.layer.cornerRadius = 3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func orderButton(_ sender: UIButton) {

    }
    
    @IBAction func selectBtn(_ sender: UIButton) {
        if checkbutton.isSelected == false {
            checkbutton.backgroundColor = .purple
            checkbutton.isSelected = true
        } else {
            checkbutton.backgroundColor = .white
            checkbutton.isSelected = false
        }
    }
}
