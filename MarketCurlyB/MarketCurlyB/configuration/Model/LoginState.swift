//
//  LoginState.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/13.
//

import Foundation

class LoginState {
    static let shared = LoginState()
    
    var state: Bool
    var Idx: Int
    var jwt: String
    var name: String = ""
    var address: String
    var cartId: Int
    var phone: String
    
    private init() {
        state = false
        Idx = 0
        jwt = ""
        address = ""
        cartId = 0
        phone = ""
    }
}
