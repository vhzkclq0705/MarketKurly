//
//  DailyCell.swift
//  MarketKurly
//
//  Created by 권오준 on 2022/07/15.
//

import UIKit

class DailyCell: UITableViewCell {
    
    // MARK: - UI
    @IBOutlet weak var timeLabel: UILabel!
    
    // MARK: - Property
    var time = 86400
    var timer: Timer?
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        startTimer()
    }
    
    // MARK: - Timer
    func startTimer() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(countDown),
            userInfo: nil,
            repeats: true)
    }
    
    @objc func countDown() {
        time -= 1
        let hour = (time / 3600) % 24
        let min = (time / 60) % 60
        let sec = String(format: "%02d", time % 60)
        let remainingTime = "\(hour) : \(min) : \(sec)"
        
        timeLabel.text = remainingTime
    }
    
}
