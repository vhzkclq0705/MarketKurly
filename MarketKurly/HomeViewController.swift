//
//  HomeViewController.swift
//  MarketKurly
//
//  Created by 권오준 on 2022/07/13.
//

import UIKit
import PagingKit

class HomeViewController: UIViewController {

    var menuViewController: PagingMenuViewController!
    var contentViewController: PagingContentViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
    }
    
    
    func configureNavigationBar() {
        
    }
    
}

// MARK: - PagingViewController 연결
extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PagingMenuViewController {
            menuViewController = vc
        } else if let vc = segue.destination as? PagingContentViewController {
            contentViewController = vc
        }
    }
}
