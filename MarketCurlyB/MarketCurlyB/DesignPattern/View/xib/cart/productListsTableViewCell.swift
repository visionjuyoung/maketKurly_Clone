//
//  productListsTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import UIKit

class productListsTableViewCell: UITableViewCell {
    
    let datamanger: CartInDataManager = CartInDataManager()
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productSubTitle: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var numberButton: UIStackView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productsImage: UIImageView!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var deleteAllButton: UIButton!
    
    var userIdx: Int = 0
    var productIdx: Int = 0
    var cartIdx: Int = 0
    var amount = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userIdx = 0
        productIdx = 0
        cartIdx = 0
        
        numberButton.layer.cornerRadius = 2
        numberButton.layer.borderWidth = 1
        numberButton.layer.borderColor = UIColor.systemGray4.cgColor
        chooseButton.layer.cornerRadius = 12
        chooseButton.backgroundColor = .purple
        chooseButton.isSelected = true
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        userIdx = 0
        productIdx = 0
        cartIdx = 0
        amount = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func minus(_ sender: UIButton) {
        datamanger.DeleateOneNum(cartIdx: cartIdx, producIdx: productIdx, delegate: self)
        amount -= 1
        amountLabel.text = "\(amount)"
    }
    
    @IBAction func deleteAll(_ sender: Any) {
        datamanger.DeleateAll(cartIdx: cartIdx, producIdx: productIdx, delegate: self)
    }
    
    
    func setImage(url: String) {
        print(url)
        productsImage.load(urlString: url)
    }
    
    func successMinusProduct(result: CartsInResult) {
        print(result)
    }
    
    func successMinusProductAll(result: CartsInResult) {
        print(result)
    }
}
