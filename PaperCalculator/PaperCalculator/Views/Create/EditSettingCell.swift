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
            questionLabel.text = "第 \(i+1) 题"
            questionLabel.textColor = lightBlue
            
            self.contentView.addSubview(questionLabel)
            
            let typeSwitch = UISwitch(frame: CGRect(x: 225, y: 25 + 70 * CGFloat(i), width: 50, height: 50))
            typeSwitch.onTintColor = lightBlue
            typeSwitch.transform.scaledBy(x: 0.75, y: 0.75)
            typeSwitch.isOn = ((model.sectionQuestionArr[index.section] as SectionQuestionModel).cellQuestionArr[i] as CellQuestionModel).questionStyle == QuestionStyle.multiScore
            typeSwitch.tag = i + 10
            
            typeSwitch.addTarget(self, action: #selector(self.typeChanged(_:)), for: UIControlEvents.valueChanged)
            self.contentView.addSubview(typeSwitch)
            
        let markNumView = NumView(frame: CGRect(x: 100, y: 20 + 70 * CGFloat(i) , width: 100, height: 50))
            
        markNumView.initUI(num: markNum)
        markNumView.index = i
        self.contentView.addSubview(markNumView)
            let tempArr = (model.sectionQuestionArr[index.section] as SectionQuestionModel).cellQuestionArr
            markNumView.changeNumHandler = {(num, index)-> Void in
                (tempArr![index] as CellQuestionModel).score = Float(num)
                (tempArr![index] as CellQuestionModel).realScore = Float(num)
            }
        
        
        }
        
        let button = UIButton(type: .custom)
       
        button.setTitle("确定", for: .normal)
        button.titleLabel?.font = mediumFont
        button.backgroundColor = lightRed
        button.layer.cornerRadius = 10
        
        button.frame = CGRect(x: 300, y: 20 + 70 * CGFloat(questionNum - 1), width: self.frame.height / 3, height: self.frame.height / 3)
        button.addTarget(self, action: #selector(self.confirmTaped), for: UIControlEvents.touchUpInside)
        
       
        

        self.contentView.addSubview(button)
        
    }
    
    func typeChanged(_ sender : UISwitch){
    
        if sender.isOn {
            ((model.sectionQuestionArr[index.section] as SectionQuestionModel).cellQuestionArr[sender.tag - 10] as CellQuestionModel).questionStyle = QuestionStyle.multiScore
        } else {
            ((model.sectionQuestionArr[index.section] as SectionQuestionModel).cellQuestionArr[sender.tag - 10] as CellQuestionModel).questionStyle = QuestionStyle.yesOrNo
        }
        
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
