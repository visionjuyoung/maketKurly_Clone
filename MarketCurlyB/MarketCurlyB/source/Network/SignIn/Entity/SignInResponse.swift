//
//  SignInResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/12.
//

import Foundation
struct SignInResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: SignInResult
}

struct SignInResult: Decodable {
    var jwt: String
    var userIdx: Int
}
