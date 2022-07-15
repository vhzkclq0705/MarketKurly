//
//  UILabel++Extensions.swift
//  MarketKurly
//
//  Created by 권오준 on 2022/07/15.
//

import UIKit

// Int형의 값을 받아 1000단위로 콤마(,)를 표시
public func formatCost(_ cost: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal

    let result = numberFormatter.string(for: cost)!
    
    return "\(result)원"
}

extension UILabel {
    // StrikeThrough 표시
    func showStrikeThrough(_ text: String) {
        let attributedString = NSAttributedString(
            string: text,
            attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        
        self.attributedText = attributedString
    }
}
