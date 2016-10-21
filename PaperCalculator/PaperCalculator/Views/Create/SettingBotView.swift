//
//  SettingBotView.swift
//  PaperCalculator
//
//  Created by appledev018 on 9/29/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class SettingBotView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var addSectionHandler : ButtonTouchUpBlock?
    var doneHandler : ButtonTouchUpBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initUI(){
        self.backgroundColor = UIColor.white
        let addSectionBtn = UIButton(type: .custom)
        addSectionBtn.frame = CGRect(x: 25, y: 15, width: 150, height: 60 )
        addSectionBtn.titleLabel?.font = mediumFont
        addSectionBtn.setTitle("增加", for:.normal )
        addSectionBtn.layer.cornerRadius = 10
        addSectionBtn.titleLabel?.textColor = UIColor.white
        addSectionBtn.backgroundColor = lightBlue
        addSectionBtn.addTarget(self, action: #selector(SettingBotView.addSection), for: UIControlEvents.touchUpInside)
        self.addSubview(addSectionBtn)
        
        let doneBtn = UIButton(type: .custom)
        doneBtn.frame = CGRect(x: 200, y: 15, width: 150, height: 60 )
        doneBtn.titleLabel?.font = mediumFont
        doneBtn.setTitle("完成", for:.normal )
        doneBtn.layer.cornerRadius = 10
        doneBtn.titleLabel?.textColor = UIColor.white
        doneBtn.backgroundColor = darkBlue
        doneBtn.addTarget(self, action: #selector(SettingBotView.done), for: UIControlEvents.touchUpInside)
        self.addSubview(doneBtn)


    }
    
    func addSection(){
        
        if addSectionHandler != nil {
            self.addSectionHandler!()
        }
    
    }
    
    func done(){
        
        if doneHandler != nil {
            self.doneHandler!()
        }
        
    }
    
}
