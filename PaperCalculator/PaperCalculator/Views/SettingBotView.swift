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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initUI(){
        self.backgroundColor = UIColor.blue
        let addSectionBtn = UIButton(type: .custom)
        addSectionBtn.frame = CGRect(x: self.frame.midX + 30, y: 20, width: 100, height: 50 )
        addSectionBtn.setTitle("增加", for:.normal )
        addSectionBtn.backgroundColor = UIColor.black
        addSectionBtn.addTarget(self, action: #selector(SettingBotView.addSection), for: UIControlEvents.touchUpInside)
        self.addSubview(addSectionBtn)

    }
    
    func addSection(){
        
        if addSectionHandler != nil {
            self.addSectionHandler!()
        }
    
    }
    
}
