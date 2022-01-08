//
//  CategoryCollectionInfo.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/08.
//

import Foundation
import UIKit

struct CategoryCollectionInfo {
    let name: String
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String) {
        self.name = name
    }
}
