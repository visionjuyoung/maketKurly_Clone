//
//  HeartResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/19.
//

import Foundation

struct HeartResponse : Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: HeartResult?
}

struct HeartResult: Decodable {
    var likeIdx: Int
}
