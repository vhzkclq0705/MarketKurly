//
//  RecommendCollectionViewCell.swift
//  MarketKurly
//
//  Created by 권오준 on 2022/07/15.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {

    // MARK: - UI
    @IBOutlet weak var couponLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var saleLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    // MARK: - Property
    var cartButtonTapHandler: (() -> Void)?
    
    // MARK: - Life cycle
    override func prepareForReuse() {
        [couponLabel, priceLabel, saleLabel]
            .forEach { $0?.isHidden = true }
    }
    
    // MARK: Setup
    func updateCell(_ recommend: Recommend) {
        imageView.image = recommend.image
        titleLabel.text = recommend.title
        totalLabel.text = formatCost(recommend.total)
        
        if let sale = recommend.sale,
           let price = recommend.price {
            priceLabel.showStrikeThrough(formatCost(price))
            saleLabel.text = "\(sale)%"
            showCoupon(coupon: recommend.coupon, sale: sale)
            initComponents(false)
        }
    }
    
    // MARK: 세일 표시
    func initComponents(_ bool: Bool) {
        [saleLabel, priceLabel]
            .forEach { $0?.isHidden = bool }
    }
    
    // MARK: 쿠폰
    func showCoupon(coupon: Bool, sale: Int) {
        if coupon {
            couponLabel.isHidden = false
            couponLabel.text = "+\(sale)%쿠폰"
        } else {
            couponLabel.isHidden = true
        }
    }
    
    // MARK: 카트 버튼 액션
    @IBAction func didTapCartButton(_ sender: Any) {
        cartButtonTapHandler?()
    }
}
