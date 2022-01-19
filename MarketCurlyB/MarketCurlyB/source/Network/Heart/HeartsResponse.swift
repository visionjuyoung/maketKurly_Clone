//
//  HeartsResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/19.
//

import Foundation

struct HeartsResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: HeartsResult
}

struct HeartsResult: Decodable {
    var counts: Int
}
