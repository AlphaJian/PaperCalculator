//
//  NoneSettingCell.swift
//  PaperCalculator
//
//  Created by appledev018 on 9/29/16.
//  Copyright © 2016 apple. All rights reserved.
//
//
//  QuestionTableViewCell.swift
//  PaperCalculator
//
//  Created by Jian Zhang on 9/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class NoneSettingCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style : UITableViewCellStyle, reuseIdentifier : String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUI(){
        self.frame.size.height = 150
        
        let questionLabel = UILabel(frame: CGRect(x: 20, y: self.frame.height/9, width: self.frame.height * 0.8, height: self.frame.height/3))
        questionLabel.text = "题目"
        
        self.addSubview(questionLabel)
        
        let markLabel = UILabel(frame: CGRect(x: 20, y: self.frame.height/9 * 5, width: self.frame.height * 0.8, height: self.frame.height/3))
        markLabel.text = "分数"
        self.addSubview(markLabel)
        
        
        
        let questionNumView = NumView(frame: CGRect(x: 100, y: self.frame.height/9, width: self.frame.height * 0.8, height: self.frame.height/3))
        questionNumView.initUI(num: 3)
        self.addSubview(questionNumView)
        
        let markNumView = NumView(frame: CGRect(x: 100, y: self.frame.height/9 * 5, width: self.frame.height * 0.8, height: self.frame.height/3))
        markNumView.initUI(num: 4)
        self.addSubview(markNumView)

        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.black
        button.setTitle("确定", for: .normal)
        button.frame = CGRect(x: 250, y: self.frame.height / 3, width: self.frame.height / 3, height: self.frame.height / 3)
        self.addSubview(button)
        
    }
    
    func clearCell(){
        for view in self.contentView.subviews {
            view.removeFromSuperview()
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
