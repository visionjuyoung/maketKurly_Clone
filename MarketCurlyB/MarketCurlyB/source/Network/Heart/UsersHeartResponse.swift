//
//  UsersHeartResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/19.
//

import Foundation

struct UsersHeartResponse : Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [UsersHeartResult]?
}
struct UsersHeartResult: Decodable {
    var productIdx: Int
    var profileImageUrl : String
    var title: String
    var price: Int
    var discount: Int
}
