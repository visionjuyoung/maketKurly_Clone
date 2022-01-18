//
//  OrderRequest.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import Foundation

struct OrderRequest: Encodable {
    var userIdx: Int
    var cartIdx: Int
    var paymentType: Int
    var couponUserIdx: Int
    var productPrice: Int
    var discountPrice: Int
    var deliveryPrice: Int
    var couponDiscount: Int
    var rewardDiscount: Int
    var amountOfPayment: Int
    
}
