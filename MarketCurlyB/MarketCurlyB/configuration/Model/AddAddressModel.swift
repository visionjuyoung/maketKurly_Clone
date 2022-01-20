//
//  AddAddressModel.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/20.
//

import Foundation

class AddAddressModel {
    static let shared = AddAddressModel()
    var address1 : String
    var address2 : String
    
    private init() {
        address1 = ""
        address2 = ""
    }
}
