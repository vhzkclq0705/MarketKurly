//
//  Recommed.swift
//  MarketKurly
//
//  Created by 권오준 on 2022/07/15.
//

import UIKit

struct Recommend {
    let coupon: Bool
    let image: UIImage
    let title: String
    let sale: Int?
    let total: Int
    let price: Int?
}

let basicRecommends: [Recommend] =
[
    Recommend(
        coupon: false,
        image: UIImage(named: "image1")!,
        title: "[일상味소] 양지 200g (냉장)",
        sale: 10, total: 8100, price: 9000),
    Recommend(
        coupon: true,
        image: UIImage(named: "image2")!,
        title: "[델리시우스] 앤초비",
        sale: 10, total: 15660, price: 17400),
    Recommend(
        coupon: false,
        image: UIImage(named: "image3")!,
        title: "[라메종드아모린] 살레위드 솔티드 버터 캐러멜 2종",
        sale: nil, total: 7900, price: nil),
    Recommend(
        coupon: false,
        image: UIImage(named: "image4")!,
        title: "[올리타리아] 오로 엑스트라버진 올리브 오일",
        sale: 10, total: 15100, price: 16900),
    Recommend(
        coupon: true,
        image: UIImage(named: "image5")!,
        title: "[자연에찬] 시래기 된장국",
        sale: 9, total: 3800, price: 4200),
    Recommend(
        coupon: false,
        image: UIImage(named: "image6")!,
        title: "[유기방아] 떡볶이떡 & 떡국떡 (냉동)",
        sale: 23, total: 3290, price: 4300),
    Recommend(
        coupon: false,
        image: UIImage(named: "image7")!,
        title: "무농약 간편 단호박 2종",
        sale: nil, total: 4990, price: nil),
    Recommend(
        coupon: false,
        image: UIImage(named: "image8")!,
        title: "[돈마루] 한돈 삼겹살 2종 (냉장)",
        sale: nil, total: 13650, price: nil),
    Recommend(
        coupon: false,
        image: UIImage(named: "image9")!,
        title: "[아리조나] 아이스티 500mL 2종",
        sale: nil, total: 2800, price: nil),
    Recommend(
        coupon: true,
        image: UIImage(named: "image10")!,
        title: "[벨리오이오소] 부라타 치즈",
        sale: 10, total: 14310, price: 15900),
]
