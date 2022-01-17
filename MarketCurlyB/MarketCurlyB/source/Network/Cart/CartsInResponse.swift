//
//  CartsInResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/17.
//

import Foundation
struct CartsInResponse : Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: CartsInResult?
}

struct CartsInResult: Decodable {
    var cartIdx : Int
    var coldProducts : [ColdProducts?]
    var frozenProducts : [FrozenProducts?]
    var roomTempProducts : [RoomtempProducts?]
    var address : String
    var subAddress : String
    var deliveryType : String
}

struct ColdProducts : Decodable {
    var productIdx : Int
    var title : String
    var profileImgUrl : String
    var price : Int
    var discount : Int
    var discountAfterPrice : Int
    var productCount : Int
}

struct FrozenProducts : Decodable {
    var productIdx : Int
    var title : String
    var profileImgUrl : String
    var price : Int
    var discount : Int
    var discountAfterPrice : Int
    var productCount : Int
}

struct RoomtempProducts : Decodable {
    var productIdx : Int
    var title : String
    var profileImgUrl : String
    var price : Int
    var discount : Int
    var discountAfterPrice : Int
    var productCount : Int
}
