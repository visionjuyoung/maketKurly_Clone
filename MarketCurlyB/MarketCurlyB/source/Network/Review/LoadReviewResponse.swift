//
//  LoadReviewResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/20.
//

import Foundation

struct LoadReviewResponse : Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: LoadReviewResult
}

struct LoadReviewResult: Decodable {
    var reviewIdx: Int
    var productIdx: Int
    var userIdx: Int
    var userName: String
    var title: String
    var content: String
    var imageUrl: String
    var createDate: String
}
