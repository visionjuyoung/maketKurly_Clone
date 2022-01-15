//
//  LoadProductInfoResponse.swift
//  MarketCurlyB
//
//  Created by 김주영 on 2022/01/15.
//

import Foundation
struct LoadProductInfoResponse : Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: LoadProductInfoResult
}

struct LoadProductInfoResult: Decodable {
    var productIdx: Int
    var title: String
    var subTitle: String
    var price: Int
    var discount: Int
    var profileImgUrl: String
    var contentTitle: String
    var contentSubTitle: String?
    var contentImageUrl: String?
    var ingredientImageUrl: String?
    var saleUnit: String
    var weight: String
    var deliveryType: String
    var packagingTypeDto: PackagingTypeDto
    var expirationDate: String?
    var checkPointImgUrl: String?
    var detailInfoImgUrl: String?
    var saleDeadLine: Date?
    var isKurlyOnly: String
    var isLimitQuantity: String
    var accumulate: Int
    var origin: String?
    var allergyDto: AllergyDto?
    var brandDto: BrandDto?
    var tipContentDto: [TipContentDto]?
    var productGuideDto: [ProductGuideDto]?
    
}

struct PackagingTypeDto: Decodable {
    var packagingTypeIdx: Int
    var name: String
}

struct AllergyDto: Decodable {
    var allergyIdx: Int
    var content: String
}

struct BrandDto: Decodable {
    var brandIdx: Int
    var brandInfo: String
    var contentImageUrl1: String?
    var contentImageUrl2: String?
}

struct TipContentDto: Decodable {
    var tipContentIdx: Int
    var title: String
    var content: String?
    var imageUrl: String?
}

struct ProductGuideDto: Decodable {
    var productGuideIdx: Int
    var content: String
}
