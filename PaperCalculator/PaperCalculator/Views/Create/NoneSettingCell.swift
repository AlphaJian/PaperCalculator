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
    
    var model = DataManager.shareManager.paperModel
    var index = IndexPath()
    var btnHandler : ButtonTouchUpBlock!
    var questionNumTemp : Int = 0
    var markNumTemp : Int = 0
    
    
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
        questionNumTemp = questionNum
        markNumTemp = markNum
        
        
        let questionLabel = UILabel(frame: CGRect(x: 20, y: self.frame.height/9, width: self.frame.height * 0.8, height: self.frame.height/3))
        questionLabel.text = "小题数"
        questionLabel.textColor = lightBlue
        
        self.addSubview(questionLabel)
        
        let markLabel = UILabel(frame: CGRect(x: 20, y: self.frame.height/9 * 5, width: self.frame.height * 0.8, height: self.frame.height/3))
        markLabel.text = "每题/分"
        markLabel.textColor = lightBlue
        
        self.addSubview(markLabel)
        
        
        
        let questionNumView = NumView(frame: CGRect(x: 90, y: self.frame.height/9, width: self.frame.height * 0.8, height: self.frame.height/3))
        questionNumView.initUI(num: questionNum)
        self.addSubview(questionNumView)
        questionNumView.changeNumHandler =  {(number, index) -> Void in
        
            self.questionNumTemp = Int(number)

        }
        
        
        
        
        let markNumView = NumView(frame: CGRect(x: 90, y: self.frame.height/9 * 5, width: self.frame.height * 0.8, height: self.frame.height/3))
        markNumView.initUI(num: markNum)
        self.addSubview(markNumView)
        markNumView.changeNumHandler =  {(number, index) -> Void in
            
            self.markNumTemp = Int(number as NSNumber)
        }

        let button = UIButton(type: .custom)
        button.backgroundColor = lightRed
        button.layer.cornerRadius = 10
        button.setTitle("确定", for: .normal)
        button.frame = CGRect(x: 250, y: self.frame.height / 3, width: self.frame.height / 3, height: self.frame.height / 3)
        button.addTarget(self, action: #selector(self.confirmTaped), for: UIControlEvents.touchUpInside)
        
        self.addSubview(button)
        
    }
    
    func confirmTaped(){
        
        DataManager.shareManager.removeSectionQuestion(sectionNum: index.section)
        DataManager.shareManager.createSectionQuestion(numberOfQuestions: questionNumTemp, score: Float(markNumTemp), style: .yesOrNo)
        (model.sectionQuestionArr[index.section] as SectionQuestionModel).editStatus = QuestionStatus.editing
        
        
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
