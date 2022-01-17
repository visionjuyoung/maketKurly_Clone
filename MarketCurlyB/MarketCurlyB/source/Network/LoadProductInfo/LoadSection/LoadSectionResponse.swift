//
//  LoadSectionResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import Foundation
struct LoadSectionResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [LoadSectionResult]
}

struct LoadSectionResult: Decodable {
    var productIdx: Int
    var title: String
    var profileImgUrl : String
    var isKurlyOnly: String
    var isLimitQuantity: String
    var price: Int
    var discount: Int
    var discountAfterPrice: Int
}
