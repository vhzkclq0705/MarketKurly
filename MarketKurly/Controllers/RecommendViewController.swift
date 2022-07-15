//
//  RecommandViewController.swift
//  MarketKurly
//
//  Created by 권오준 on 2022/07/15.
//

import UIKit
import PagingKit

class RecommendViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
    }
    
    func configureViewController() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let imageSlideNib = UINib(nibName: "ImageSlideCell", bundle: nil)
        let recommendNib = UINib(nibName: "RecommendCell", bundle: nil)
        let bannerNib = UINib(nibName: "BannerCell", bundle: nil)
        let dailyNib = UINib(nibName: "DailyCell", bundle: nil)
        
        tableView.register(imageSlideNib, forCellReuseIdentifier: "ImageSlideCell")
        tableView.register(recommendNib, forCellReuseIdentifier: "RecommendCell")
        tableView.register(bannerNib, forCellReuseIdentifier: "BannerCell")
        tableView.register(dailyNib, forCellReuseIdentifier: "DailyCell")
    }
}

extension RecommendViewController: UITableViewDelegate,
                                   UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageSlideCell") as? ImageSlideCell else {
                return UITableViewCell()
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell") as? BannerCell else {
                return UITableViewCell()
            }
            return cell
//        case 3:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DailyCell") as? DailyCell else {
//                return UITableViewCell()
//            }
//            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendCell") as? RecommendCell else {
                return UITableViewCell()
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
