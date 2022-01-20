//
//  AddAddressResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/20.
//

import Foundation

struct AddAddressResponse: Decodable {
    var isSuccess : Bool?
    var code : Int?
    var message : String?
    var result: AddAddressResult?
}

struct AddAddressResult: Decodable {
    var deliveryInfoIdx: Int
}
