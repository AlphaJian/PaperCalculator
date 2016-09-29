//
//  QuestionTableViewCell.swift
//  PaperCalculator
//
//  Created by Jian Zhang on 9/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

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
    
    func initUI(questionArr : [CellQuestionModel]){
        if questionArr.count == 3
        {
            print("")
        }
        let width = self.frame.width / CGFloat(questionArr.count)
        var originX = 0
        for i in 0 ... questionArr.count - 1 {
            let model = questionArr[i]
            let btn = UIButton(type: .roundedRect)
            btn.frame = CGRect(x: originX, y: 0, width: Int(width), height: 40)
            btn.setTitle("第\(model.questionNo!)", for: .normal)
            
            originX = Int(btn.right())
            self.contentView.addSubview(btn)
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
