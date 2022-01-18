//
//  OrderResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import Foundation

struct OrderResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: OrderResult?
}

struct OrderResult: Decodable {
    var orderIdx: Int
}
