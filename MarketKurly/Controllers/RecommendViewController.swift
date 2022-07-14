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

    }
    
    func configureViewController() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension RecommendViewController: UITableViewDelegate,
                                   UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
