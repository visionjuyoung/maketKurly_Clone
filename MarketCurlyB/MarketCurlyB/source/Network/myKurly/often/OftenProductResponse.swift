//
//  OftenProductResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import Foundation

struct OftenProductResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [OftenProductResult]
}

struct OftenProductResult: Decodable {
    var productIdx: Int
    var title: String
    var price: Int
    var count: Int
}
