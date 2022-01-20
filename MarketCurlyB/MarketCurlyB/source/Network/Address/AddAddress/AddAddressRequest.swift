//
//  AddAddressRequest.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/20.
//

import Foundation

struct AddAddressRequest: Encodable {
    var userIdx: Int
    var address: String
    var extraAddress: String
}
