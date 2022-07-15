//
//  RecommendCell.swift
//  MarketKurly
//
//  Created by 권오준 on 2022/07/15.
//

import UIKit

class RecommendCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let recommends = basicRecommends.shuffled()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    func configureCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let nib = UINib(nibName: "RecommendCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "RecommendCollectionViewCell")
    }
}

extension RecommendCell: UICollectionViewDelegate,
                         UICollectionViewDataSource,
                         UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommends.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendCollectionViewCell", for: indexPath) as? RecommendCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        
        cell.updateCell(recommends[indexPath.item])
        
        cell.cartButtonTapHandler = {
            // TODO: 삭제 구현
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 300)
    }
}
