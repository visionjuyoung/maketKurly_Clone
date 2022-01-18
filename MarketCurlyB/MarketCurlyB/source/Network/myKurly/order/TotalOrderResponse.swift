//
//  TotalOrderResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/18.
//

import Foundation

struct TotalOrderResponse: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [TotalOrderResult]
}

struct TotalOrderResult: Decodable {
    var orderIdx: Int
    var title: String
    var type: Int
    var cases: Int
    var paymentDate: String
    var paymentType: String
    var amountOfPayment: Int
    var deliveryStatus: String
}
