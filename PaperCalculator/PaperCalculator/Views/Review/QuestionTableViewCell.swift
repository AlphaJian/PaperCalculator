//
//  QuestionTableViewCell.swift
//  PaperCalculator
//
//  Created by Jian Zhang on 9/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    var btnHandler : ReturnWithThreeParmsBlock!
    var multiBtnHandler : ReturnWithThreeParmsBlock!
    var nextPaperHandler : ButtonTouchUpBlock!
    var indexPath : IndexPath!
    var questionArr : [CellQuestionModel]!
    
    
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
    
    
    func initLastCell (){
    
        let btn = UIButton(type: .custom)
        btn.layer.cornerRadius = 10
        btn.frame = CGRect(x: LCDW - 20 - 150, y: 0, width: 150, height: 60)
        btn.backgroundColor = darkBlue
        btn.titleLabel?.font = mediumFont
        btn.setTitle("批改下一个", for: .normal)
         btn.addTarget(self, action: #selector(QuestionTableViewCell.nextBtnTapped), for: .touchUpInside)
        self.contentView.addSubview(btn)
 
    }
    
    func nextBtnTapped() {
        let paperModelSave : PaperModel = DataManager.shareManager.paperModel.copySelf()
        DataManager.shareManager.papersArray.append(paperModelSave)
        DataManager.shareManager.paperModel = DataManager.shareManager.paperModelTemp.copySelf()
        if nextPaperHandler != nil {
        
        nextPaperHandler!()
        }
        
        
    }
    
    
    
    
    
    
    func initUI(arr : [CellQuestionModel], index : IndexPath){
        questionArr = arr
        indexPath = index
        let padding = 20
        
        let width = (LCDW - 3 * CGFloat(padding)) / 2
        
        var originX = padding

        for i in 0 ... questionArr.count - 1 {
            let model = questionArr[i]

            let btn = UIButton(type: .custom)
            btn.layer.cornerRadius = 10
            btn.frame = CGRect(x: originX, y: 0, width: Int(width), height: 60)
            
            let titleQuestionNo : String = "( \(model.questionNo!) )"
            let titleScore : String = " \(model.realScore!)"
            let totalTitle = titleQuestionNo + titleScore
            
           let title : NSMutableAttributedString = NSMutableAttributedString(string: totalTitle, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 25)])
           
            title.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 10), range: NSRange.init(location: titleQuestionNo.characters.count, length: totalTitle.characters.count - titleQuestionNo.characters.count))
            title.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range: NSRange.init(location: 0, length: totalTitle.characters.count))
            
            btn.setAttributedTitle(title , for: .normal)
            //btn.setTitle("( \(model.questionNo!) )  --  \(model.realScore!)", for: .normal)
            btn.titleLabel?.backgroundColor = UIColor.clear
            btn.titleLabel?.font = mediumFont
            btn.addTarget(self, action: #selector(QuestionTableViewCell.btnTapped(_:)), for: .touchUpInside)
            btn.tag = 10 + i

            originX = Int(btn.right()) + padding
            self.contentView.addSubview(btn)
            
            if model.realScore < model.score
            {
                btn.backgroundColor = lightRed
            }
            else
            {
                btn.backgroundColor = lightBlue
            }
        }
    }
    
    func btnTapped(_ sender: UIButton)
    {
        
        let model = questionArr[sender.tag - 10] as CellQuestionModel
        
        //Indexpath exchange
        
        if model.questionStyle == .yesOrNo
        {
            if model.score == model.realScore
            {
                model.realScore = 0
            }
            else
            {
                model.realScore = model.score
            }
            if btnHandler != nil
            {
                let index = IndexPath(row: indexPath.row * 2 + sender.tag - 10, section: indexPath.section)
                btnHandler!(index as AnyObject, indexPath as AnyObject ,model)
            }
        }
        else
        {
            if multiBtnHandler != nil
            {
                let index = IndexPath(row: indexPath.row * 2 + sender.tag - 10, section: indexPath.section)
                multiBtnHandler!(index as AnyObject, indexPath as AnyObject ,model)
            }
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
