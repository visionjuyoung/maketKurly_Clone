//
//  LoadAddressResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import Foundation
struct LoadAddressResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: LoadAddressResult
}

struct LoadAddressResult: Decodable {
    var address: String
    var receiver: String?
    var receiverPhone: String
    var deliveryType: String
}
