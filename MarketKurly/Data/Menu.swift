//
//  Menu.swift
//  MarketKurly
//
//  Created by 권오준 on 2022/07/15.
//

import UIKit

public let menu = [
    (title: "컬리추천", vc: UIStoryboard(
        name: "Main",
        bundle: nil)
        .instantiateViewController(withIdentifier: "RecommendViewController") as! RecommendViewController),
    (title: "신상품", vc: UIViewController()),
    (title: "베스트", vc: UIViewController()),
    (title: "알뜰쇼핑  ", vc: UIViewController()),
    (title: "특가/혜택", vc: UIViewController()),
]
