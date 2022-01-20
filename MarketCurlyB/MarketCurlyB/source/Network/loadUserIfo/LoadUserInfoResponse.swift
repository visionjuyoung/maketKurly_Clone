//
//  loadUserInfoRsponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/14.
//

import Foundation

struct LoadUserInfoResponse : Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: LoadInfoResult?
}

struct LoadInfoResult: Decodable {
    var userIdx: Int
    var name: String
    var id: String
    var email: String
    var phone: String
}
