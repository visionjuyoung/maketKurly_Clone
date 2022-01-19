//
//  HeartDeleteResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/19.
//

import Foundation
struct HeartDeleteResponse: Decodable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: String?
}
