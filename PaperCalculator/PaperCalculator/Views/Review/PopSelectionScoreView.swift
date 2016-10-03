//
//  PopSelectionScoreView.swift
//  PaperCalculator
//
//  Created by Jian Zhang on 9/29/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class PopSelectionScoreView: UIView {
    
    var btnHandler : ReturnBlock?
    
    func initUI(score : Float){
        let bg = UIView(frame: self.bounds)
        bg.backgroundColor = UIColor.black
        bg.alpha = 0.8
        self.addSubview(bg)
        
        let padding = 20
        let container = UIScrollView(frame: CGRect(x: padding, y: 0, width: Int(self.width()) - padding * 2, height: Int(self.height()) - 2 * padding))
        self.addSubview(container)
        
        var originX = padding
        var originY = padding
        var width = (Int(container.width()) - padding * 4) / 3
        var height = 0
        if Int(score) % 3 == 0
        {
            height = (width + padding) * (Int(score) / 3)
        }
        else
        {
            height = (width + padding) * (Int(score) / 3 + 1)
        }
        container.contentSize = CGSize(width: Int(container.width()), height: height)

        for i in 0 ... Int(score) {
            let btn = UIButton(type: .custom)
            btn.frame = CGRect(x: originX, y: originY, width: width, height: width)
            btn.backgroundColor = UIColor.white
            btn.setTitleColor(lightBlue, for: .normal)
            btn.layer.cornerRadius = btn.width() / 2
//            btn.layer.borderWidth = 2
//            btn.layer.borderColor = lightBlue.cgColor
            btn.addTarget(self, action: #selector(PopSelectionScoreView.btnTapped(_:)), for: .touchUpInside)
            btn.tag = 10 + Int(score) - i
            btn.setTitle("\(Int(score) - i)", for: .normal)
            container.addSubview(btn)
            
            originX = Int(btn.right()) + padding
            if originX + width > Int(container.width())
            {
                originX = padding
                originY = Int(btn.bottom()) + padding
            }
        }
    }
    
    func btnTapped(_ sender : UIButton)
    {
        if btnHandler != nil
        {
            btnHandler!(sender.tag - 10 as AnyObject)
        }
    }
}
