//
//  ProductViewState.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/17.
//

import Foundation

class ProductViewState {
    static let shared = ProductViewState()

    var Idx: Int
    var title: String
    var subTitle: String
    var price: Int
    var image: String
    var pack: String
    var weight: String
    var packageType: String
    var deliveryType: String
    var allery: String
    var date: String
    var amount: Int
    
    private init() {
        Idx = 0
        title = ""
        subTitle = ""
        price = 0
        image = ""
        pack = ""
        weight = ""
        packageType = ""
        deliveryType = ""
        allery = ""
        date = "수령일 포함 최소 6일 남은 제품을 보내 드립니다"
        amount = 0
    }
}
