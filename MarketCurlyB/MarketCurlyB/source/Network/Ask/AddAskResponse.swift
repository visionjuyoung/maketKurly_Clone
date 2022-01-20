//
//  AddAskResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/20.
//

import Foundation

struct AddAskResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [AddAskResult]
}

struct AddAskResult: Decodable {
    var questionIdx: Int
    var userIdx: Int
    var title: String
    var question: String
    var isLock: String
    var createDate: String?
    var answerRes: AnswerRes2?
}

struct AnswerRes2: Decodable {
    var answerIdx:Int?
    var answer: String?
}
