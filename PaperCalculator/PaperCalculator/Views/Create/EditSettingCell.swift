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

class EditSettingCell: UITableViewCell {
    
    var model = DataManager.shareManager.paperModel
    var index = IndexPath()
    var btnHandler : ButtonTouchUpBlock!
    
    
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
    
    func initUI(questionNum: Int, markNum: Int, index : IndexPath){
        self.frame.size.height = 150
        self.index = index
        
        
        for i in 0...questionNum - 1 {
        
        let questionLabel = UILabel(frame: CGRect(x: 20, y: 20 + 70 * CGFloat(i) , width: 100, height: 50))
        questionLabel.text = "题目\(i+1)"
        
        self.addSubview(questionLabel)
        
        }
        
        for i in 0...questionNum - 1 {
        
        let markNumView = NumView(frame: CGRect(x: 100, y: 20 + 70 * CGFloat(i) , width: 100, height: 50))
        markNumView.initUI(num: markNum)
        self.addSubview(markNumView)
        
        }
        
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.black
        button.setTitle("确定", for: .normal)
        button.frame = CGRect(x: 250, y: 20 + 70 * CGFloat(questionNum - 1), width: self.frame.height / 3, height: self.frame.height / 3)
        button.addTarget(self, action: #selector(self.confirmTaped), for: UIControlEvents.touchUpInside)
        
       
        

        self.addSubview(button)
        
    }
    
    func confirmTaped(){
        (model.sectionQuestionArr[index.section] as SectionQuestionModel).editStatus = QuestionStatus.finish
        if btnHandler != nil {
            btnHandler()
        }
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