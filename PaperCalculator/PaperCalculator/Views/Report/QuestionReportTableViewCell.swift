//
//  QuestionReportTableViewCell.swift
//  PaperCalculator
//
//  Created by appledev018 on 10/11/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class QuestionReportTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initUI (index: IndexPath) {
        
        let numOfPaper: Float = Float(DataManager.shareManager.paperNum - 1)
        
    let result = DataManager.shareManager.getQuestionStates(section: index.section, row: index.row)
        
    let label = UILabel.init(frame: CGRect(x: 10, y: 0, width: 50, height: 40))
    label.text = "(\(index.row))"
    label.textColor = darkBlue
    label.textAlignment = NSTextAlignment.center
        
    let markLabel1 = UILabel.init(frame: CGRect(x: 80, y: 0, width: 100, height: 40))
        
    let a = String(format: "%.1f", result.realScore/numOfPaper)
    let b = String(format: "%.1f", result.score/numOfPaper)
        
    markLabel1.text = "\(a)/\(b)"
    markLabel1.textColor = lightBlue
    markLabel1.font = UIFont.systemFont(ofSize: 16)
    markLabel1.alpha = CGFloat(Float(1.3) - Float(result.realScore/result.score))
        
        let markLabel2 = UILabel.init(frame: CGRect(x: 180, y: 0, width: 100, height: 40))
        markLabel2.text = "\(result.realScore/result.score)"
        
        if result.realScore/result.score < 0.5 {
            markLabel2.textColor = darkRed
        } else {
            markLabel2.textColor = lightBlue
        }
        
        markLabel2.font = UIFont.systemFont(ofSize: 16)
        markLabel2.alpha = CGFloat(Float(1.3) - Float(result.realScore/result.score))
        
        let markLabel3 = UILabel.init(frame: CGRect(x: 300, y: 0, width: 100, height: 40))
        markLabel3.text = "\(result.faultNum)人"
        if Float(result.faultNum)/numOfPaper > 0.5 {
        markLabel3.textColor = darkRed
        } else {
            markLabel3.textColor = lightBlue
        }
        
        markLabel3.font = UIFont.systemFont(ofSize: 16)
        markLabel3.alpha = CGFloat(Double(result.faultNum)/Double(DataManager.shareManager.papersArray.count) + 0.3)
        

        
    self.contentView.addSubview(label)
    self.contentView.addSubview(markLabel1)
    self.contentView.addSubview(markLabel2)
    self.contentView.addSubview(markLabel3)
   
    }

    func clearCell(){
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
    }
}
