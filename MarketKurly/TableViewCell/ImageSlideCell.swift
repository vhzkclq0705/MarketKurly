//
//  ImageSlideCell.swift
//  MarketKurly
//
//  Created by 권오준 on 2022/07/15.
//

import UIKit

class ImageSlideCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var countLabel: UILabel!
    
    var timer: Timer?
    var index = 0
    let images = basicRecommends.map { $0.image }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
        startTimer()
    }
    
    func configureCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "ImageSlideCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "ImageSlideCollectionViewCell")
        
        countLabel.layer.cornerRadius = countLabel.frame.height / 2
        countLabel.text = "1 / \(images.count)"
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 3,
            target: self,
            selector: #selector(moveIndex),
            userInfo: nil,
            repeats: true)
    }
    
    @objc func moveIndex() {
        countLabel.text = "\(index + 1) / \(images.count)"
        
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(
            at: IndexPath(item: index, section: 0),
            at: .centeredHorizontally,
            animated: true)
        collectionView.isPagingEnabled = true
        
        index += 1
        if index == images.count {
            index = 0
        }
    }
}

extension ImageSlideCell: UICollectionViewDelegate,
                          UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageSlideCollectionViewCell", for: indexPath) as? ImageSlideCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.updateCell(images[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width, height: 300)
    }
}
