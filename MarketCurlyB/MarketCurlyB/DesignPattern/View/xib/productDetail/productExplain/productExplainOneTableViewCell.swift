//
//  productExplainOneTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/17.
//

import UIKit

class productExplainOneTableViewCell: UITableViewCell {

    @IBOutlet weak var productExplainImg: UIImageView!
    @IBOutlet weak var productExplainTitle: UILabel!
    @IBOutlet weak var productExplainSubTitle: UILabel!
    @IBOutlet weak var productExplainPrice: UILabel!
    
    @IBOutlet weak var loginStateLabel: UILabel!
    
    
    let state = LoginState.shared
    let productState = ProductViewState.shared
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if state.state == true {
            loginStateLabel.isHidden = true
        }
        print(productState.title)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UIImageView { func load(url: URL) { DispatchQueue.global().async { [weak self] in if let data = try? Data(contentsOf: url) { if let image = UIImage(data: data) { DispatchQueue.main.async { self?.image = image } } } } } }

