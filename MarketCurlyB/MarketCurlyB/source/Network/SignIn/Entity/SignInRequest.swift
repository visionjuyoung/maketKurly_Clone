//
//  SignInRequest.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/12.
//

import Foundation
struct SignInRequest: Encodable {
    var name: String
    var id: String
    var pwd: String
    var email: String
    var phone: String
    var adress: String
    var exraAdress : String
    var birthDate: String?
    var gender: String?
    var recommender: String?
    var eventName: String?
    var isTermsOfUseAgree: String
    var isPersonalInfoCollectAgree: String
    var isPersonalInfoUsageAgree: String?
    var isSmsReceiveAgree: String?
    var isEmailReceiveAgree: String?
    var isAgeAboveForteen: String
}
