//
//  RankReportTableViewCell.swift
//  PaperCalculator
//
//  Created by appledev018 on 10/14/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class RankReportTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func initUI () {
        var bestName = ""
        var lastName = ""
        
        for i in 0...DataManager.shareManager.bestArr.count - 1 {
        bestName = bestName + "\(DataManager.shareManager.bestArr[i].name) "
        }
        
        for i in 0...DataManager.shareManager.lastArr.count - 1 {
            lastName = lastName + "\(DataManager.shareManager.lastArr[i].name) "
        }
        
        let label = UILabel.init(frame: CGRect(x: 15, y: 0, width: 300, height: 40))
        label.text = "最佳：" + bestName + " \(DataManager.shareManager.bestArr[0].totalScore!)分"
        label.textColor = darkBlue
        //label.textAlignment = NSTextAlignment.center
        
        let label1 = UILabel.init(frame: CGRect(x: 15, y: 50, width: 300, height: 40))
        label1.text = "最差：" + lastName + " \(DataManager.shareManager.lastArr[0].totalScore!)分"
        label1.textColor = darkBlue
        //label1.textAlignment = NSTextAlignment.center
        
        
        self.contentView.addSubview(label1)
        self.contentView.addSubview(label)
    }
}
