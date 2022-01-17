//
//  bannerTableViewCell.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/10.
//

import UIKit

class bannerTableViewCell: UITableViewCell {

    @IBOutlet weak var firstHomeBanner: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setImages()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImages() {
        var images: [UIImage] = []
        images.append(UIImage(named: "home1")!)
        images.append(UIImage(named: "home2")!)
        images.append(UIImage(named: "home3")!)
        images.append(UIImage(named: "home4")!)
        images.append(UIImage(named: "home5")!)
        images.append(UIImage(named: "home6")!)
        images.append(UIImage(named: "home7")!)
        images.append(UIImage(named: "home8")!)
        images.append(UIImage(named: "home9")!)
        images.append(UIImage(named: "home10")!)
        images.append(UIImage(named: "home11")!)
        images.append(UIImage(named: "home12")!)
        images.append(UIImage(named: "home13")!)
        
        firstHomeBanner.animationImages = images
        firstHomeBanner.animationDuration = 25.0
        firstHomeBanner.startAnimating()
    }
}
