//
//  LoginResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/12.
//

import Foundation

struct LoginResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: LogInResult
}

struct LogInResult: Decodable {
    var jwt: String
    var userIdx: Int
    var cartIdx: Int
}
