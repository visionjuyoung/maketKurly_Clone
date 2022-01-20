//
//  AddAskRequest.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/20.
//

import Foundation

struct AddAskRequest: Encodable {
    var userIdx : Int
    var productIdx: Int
    var title: String
    var question: String
    var isLock: String
}
