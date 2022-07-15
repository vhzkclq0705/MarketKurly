//
//  TableViewCell.swift
//  MarketKurly
//
//  Created by 권오준 on 2022/07/15.
//

import UIKit
import PagingKit

class MenuCell: PagingMenuViewCell {
    
    static let identifier = "MenuCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override public var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? #colorLiteral(red: 0.3396247625, green: 0.03896826506, blue: 0.4810866714, alpha: 1) : .darkGray
            titleLabel.font = isSelected
            ? .systemFont(ofSize: 15, weight: .semibold)
            : .systemFont(ofSize: 15, weight: .regular)
        }
    }
    
}
