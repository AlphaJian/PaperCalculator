//
//  NumView.swift
//  PaperCalculator
//
//  Created by appledev018 on 9/29/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class NumView: UIView {

    var changeNumHandler : ButtonTouchUpReturnInt?
    var index = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let numLbl = UILabel()
    
    func initUI(num: Int) {
        self.backgroundColor = lightBlue
        self.layer.cornerRadius = 10
        let addButton = UIButton(type: .custom)
        addButton.setTitle("+", for: .normal)
        addButton.frame = CGRect(x: self.frame.width/3 * 2, y: 0, width: self.frame.width/3, height: self.frame.height)
        addButton.addTarget(self, action: #selector(NumView.addButtonTapped), for: UIControlEvents.touchUpInside)
        self.addSubview(addButton)
        
        let minusButton = UIButton(type: .custom)
        minusButton.setTitle("-", for: .normal)
        minusButton.frame = CGRect(x:  0, y: 0, width: self.frame.width/3, height: self.frame.height)
        minusButton.addTarget(self, action: #selector(NumView.minusButtonTapped), for: UIControlEvents.touchUpInside)
        self.addSubview(minusButton)
        
        numLbl.frame = CGRect(x: self.frame.width/3, y: 0, width: self.frame.width/3, height: self.frame.height)
        numLbl.textAlignment = NSTextAlignment.center
//        let numLbl = UILabel(frame: CGRect(x: self.frame.width/3, y: 0, width: self.frame.width/3, height: self.frame.height))
        numLbl.text = "\(num)"
        numLbl.textColor = UIColor.white
        self.addSubview(numLbl)
        
    }
    
    func addButtonTapped(){
        print("+")
       numLbl.text = "\((numLbl.text! as NSString).intValue + 1)"
        if changeNumHandler != nil {
            self.changeNumHandler!(Int((numLbl.text! as NSString).intValue), index)
        }
        
    }
    func minusButtonTapped(){
        print("-")
        numLbl.text = "\((numLbl.text! as NSString).intValue - 1)"
        if changeNumHandler != nil {
            self.changeNumHandler!(Int((numLbl.text! as NSString).intValue), index)
        }
    }


}
