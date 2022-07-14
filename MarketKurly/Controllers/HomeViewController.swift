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
        configureViewController()
    }
    
    func configureNavigationBar() {
        
    }
    
    func configureViewController() {
        menuViewController.register(
            nib: UINib(nibName: "MenuCell", bundle: nil),
            forCellWithReuseIdentifier: MenuCell.identifier)
        menuViewController.registerFocusView(
            nib: UINib(nibName: "FocusView", bundle: nil))
        menuViewController.reloadData()
        contentViewController.reloadData()
    }
    
}

// MARK: - PagingMenuViewController
extension HomeViewController: PagingMenuViewControllerDataSource,
                              PagingMenuViewControllerDelegate {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PagingMenuViewController {
            menuViewController = vc
            menuViewController.dataSource = self
            menuViewController.delegate = self
        } else if let vc = segue.destination as? PagingContentViewController {
            contentViewController = vc
            contentViewController.dataSource = self
            contentViewController.delegate = self
        }
    }
    
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return menu.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return viewController.view.frame.width / 5
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(
            withReuseIdentifier: MenuCell.identifier,
            for: index) as! MenuCell
        
        cell.titleLabel.text = menu[index].title
        
        return cell
    }
    
    func menuViewController(viewController: PagingMenuViewController, willDisplay cell: PagingMenuViewCell, forItemAt index: Int) {
        cell.tintColor = .red
    }
    
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentViewController.scroll(to: page, animated: true)
    }
}

// MARK: - PagingContetViewController
extension HomeViewController: PagingContentViewControllerDataSource,
                              PagingContentViewControllerDelegate {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return menu.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return menu[index].vc
    }
    
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        menuViewController.scroll(index: index, percent: percent, animated: true)
    }
}
