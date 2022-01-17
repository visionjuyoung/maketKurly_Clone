//
//  CartsInDataManager.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/17.
//

import Foundation
import Alamofire

struct CartInDataManager {
    func loadCarts(userIdx: Int, delegate: cartViewController) {
        let url = "https://prod.kaydenserver.shop/api/carts/?userIdx=\(userIdx)"
        
        AF.request(url, method: .get, parameters: nil, headers: nil).responseDecodable(of: CartsInResponse.self) { (response) in
                switch response.result {
                case .success(let response):
                    //함수
                    delegate.didSuccessLoadCarts(result: response.result)
                    print("")
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func AddCart(userIdx: Int, producIdx: Int, delegate: selectAmountViewController) {
        AF.request("https://prod.kaydenserver.shop/api/carts/?userIdx=\(userIdx)&productIdx=\(producIdx)", method: .post, parameters: nil, headers: nil).validate()
            .responseDecodable(of: CartsInResponse.self) { response in
                switch response.result {
                case .success(let response):
                    if response.isSuccess {
                        print(response.result)
                    } else {
                        switch response.code {
                        case 2000:
                            print("입력값 확인")
                        case 4000: print("데이터베이스 연결 실패")
                        default: print("else...")
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
            }
    }
}
