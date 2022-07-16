//
//  RecommendCell.swift
//  MarketKurly
//
//  Created by 권오준 on 2022/07/15.
//

import UIKit

class RecommendCell: UITableViewCell {

    // MARK: - UI
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    // MARK: - Property
    var recommends = basicRecommends.shuffled()
    var refreshButtonTapHandler: (() -> Void)?
    var addButtonTapHandler: (() -> Void)?
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
        // 테스트
    }
    
    // MARK: - Setup
    func configureCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let nib = UINib(nibName: "RecommendCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "RecommendCollectionViewCell")
    }
    
    // MARK: - Button actions
    @IBAction func didTapRefreshButton(_ sender: Any) {
        refreshButtonTapHandler?()
        collectionView.reloadData()
    }
    
    @IBAction func didTapAddButton(_ sender: Any) {
        addButtonTapHandler?()
        collectionView.reloadData()
    }
}

// MARK: - CollectionView
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
            self.recommends.remove(at: indexPath.item)
            collectionView.reloadData()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 300)
    }
}
