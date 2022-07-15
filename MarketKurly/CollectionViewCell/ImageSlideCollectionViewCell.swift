//
//  ImageSlideCollectionViewCell.swift
//  MarketKurly
//
//  Created by 권오준 on 2022/07/15.
//

import UIKit

class ImageSlideCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    func updateCell(_ image: UIImage) {
        imageView.image = image
    }

}
