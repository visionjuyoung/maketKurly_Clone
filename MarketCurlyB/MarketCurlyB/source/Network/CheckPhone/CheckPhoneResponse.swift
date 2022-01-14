//
//  CheckPhoneResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/14.
//

import Foundation

struct CheckPhoneResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: CheckPhoneResults?
}

struct CheckPhoneResults: Decodable {
    var certNum: String
}
