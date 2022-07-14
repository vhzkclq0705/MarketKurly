//
//  RecommendCollectionViewCell.swift
//  MarketKurly
//
//  Created by 권오준 on 2022/07/15.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlet
    @IBOutlet weak var coupon: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var saleLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    // MARK: - Property
    var cartButtonTapHandler: (() -> Void)?
    
    // MARK: - Funcs
    // MARK: 셀 업데이트
    func updateCell(image: UIImage, title: String, sale: Int?, total: Int, price: Int?) {
        imageView.image = image
        titleLabel.text = title
        
        if let sale = sale,
           let price = price {
            calculatePrice(price: price, sale: sale)
            checkCoupon(sale)
            saleLabel.isHidden = false
        } else {
            saleLabel.isHidden = true
        }
    }
    
    // MARK: 30% 확률로 쿠폰 생성
    func checkCoupon(_ sale: Int) {
        let num = Int.random(in: 1...10)
        
        switch num {
        case 1, 2, 3:
            coupon.setTitle("+\(sale)%쿠폰", for: .normal)
            coupon.isHidden = false
        default: coupon.isHidden = true
        }
    }
    
    // MARK: 할인 계산
    func calculatePrice(price: Int, sale: Int) {
        let salePrice = price / 100 * sale
        let total = price - salePrice
        
        saleLabel.text = "\(sale)%"
        priceLabel.showStrikeThrough("\(price)")
        totalLabel.formatCost(total)
    }

    // MARK: 카트 버튼 액션
    @IBAction func didTapCartButton(_ sender: Any) {
        cartButtonTapHandler?()
    }
}
