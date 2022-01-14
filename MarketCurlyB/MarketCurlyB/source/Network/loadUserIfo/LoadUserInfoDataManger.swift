//
//  loadUserInfoDataManger.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/14.
//

import Foundation

import Alamofire

class LoadUserInfoDataManager {
    func loadId(userIdx: Int, delegate: logInViewController) {
        let url = "https://prod.kaydenserver.shop/api/users"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).responseDecodable(of: LoadUserInfoResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    delegate.didSuccessLoadId(response.result[userIdx])
                case .failure(let error):
                    print(error)
                    //delegate.checkIdFail()
                }
            }
    }
}
