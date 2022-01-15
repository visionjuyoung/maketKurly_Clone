//
//  LoadProductInfoDataManager.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/15.
//


import Foundation
import Alamofire

struct LoadProductDataManager {
    func loadProduct(productIdx: Int, delegate: firstHomeViewController) {
        let url = "https://prod.kaydenserver.shop/api/users"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).responseDecodable(of: LoadProductInfoResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    //함수
                    print("")
                case .failure(let error):
                    print(error)
                }
            }
    }
}
