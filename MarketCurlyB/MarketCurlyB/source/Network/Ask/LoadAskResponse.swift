//
//  LoadAskResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/20.
//

import Foundation

struct LoadAskResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [LoadAskResult]
}

struct LoadAskResult: Decodable {
    var questionIdx: Int
    var userIdx: Int
    var title: String
    var question: String
    var isLock: String
    var createDate: String?
    var answerRes: AnswerRes?
}

struct AnswerRes: Decodable {
    var answerIdx:Int?
    var answer: String?
}
