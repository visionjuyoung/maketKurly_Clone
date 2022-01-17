//
//  LoadProductInfoDataManager.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/15.
//


import Foundation
import Alamofire

struct LoadProductDataManager {
    func loadProduct(productIdx: Int, delegate: productExplainViewController) {
        let url = "https://prod.kaydenserver.shop/api/products/\(productIdx)"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).responseDecodable(of: LoadProductInfoResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    //함수
                    delegate.didSuccessLoadProductInfo(result: response.result)
                    print("")
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func loadProduct(productIdx: Int, delegate: selectAmountViewController) {
        let url = "https://prod.kaydenserver.shop/api/products/\(productIdx)"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).responseDecodable(of: LoadProductInfoResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    //함수
                    delegate.didSuccessLoadProductInfo(result: response.result)
                    print("")
                case .failure(let error):
                    print(error)
                }
            }
    }
}
