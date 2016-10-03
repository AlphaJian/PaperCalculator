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
    
    func initUI(arr : [CellQuestionModel], index : IndexPath){
        questionArr = arr
        indexPath = index
        let padding = 10
        
        let width = (self.frame.width - 3 * CGFloat(padding)) / 2
        
        var originX = padding

        for i in 0 ... questionArr.count - 1 {
            let model = questionArr[i]

            let btn = UIButton(type: .custom)
            btn.layer.cornerRadius = 10
            btn.frame = CGRect(x: originX, y: 0, width: Int(width), height: 60)
            btn.setTitle("第 \(model.questionNo!) 小题, \(model.realScore!)", for: .normal)
            btn.titleLabel?.backgroundColor = UIColor.clear
            btn.addTarget(self, action: "btnTapped:", for: .touchUpInside)
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
