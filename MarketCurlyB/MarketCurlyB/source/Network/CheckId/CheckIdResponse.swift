//
//  CheckIdResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/13.
//

import Foundation

struct CheckIdResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: CheckIdResults?
}

struct CheckIdResults: Decodable {
    var status: String
}
