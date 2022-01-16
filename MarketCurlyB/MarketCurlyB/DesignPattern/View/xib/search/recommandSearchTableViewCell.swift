//
//  recommandSearchTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/11.
//

import UIKit

class recommandSearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let str: [String] = ["떡복이", "돈까스", "체리", "삼겹살", "주스", "그래놀라", "닭갈비", "김치", "안심"]
        
        let labels: [UILabel] = [label1, label2 , label3, label4, label5, label6, label7, label8, label9]
        
        for label in labels {
            label.layer.cornerRadius = 10
            label.layer.masksToBounds = true
        }
        
        for i in 0...8{
            labels[i].text = str[i]
        }

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
