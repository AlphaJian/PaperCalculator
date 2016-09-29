//
//  ViewFrameExtension.swift
//  BusinessOS
//
//  Created by Jian Zhang on 11/9/15.
//  Copyright © 2015 PwC. All rights reserved.
//

import UIKit

extension UIView
{
    func width() -> CGFloat
    {
        return self.frame.size.width
    }
    
    func height() -> CGFloat
    {
        return self.frame.size.height
    }
    
    func x() -> CGFloat
    {
        return self.frame.origin.x
    }
    
    func y() -> CGFloat
    {
        return self.frame.origin.y
    }
    
    func right() -> CGFloat
    {
        return self.x() + self.width()
    }
    
    func bottom() -> CGFloat
    {
        return self.y() + self.height()
    }
    
    func setY(y : CGFloat)
    {
        self.frame.origin.y = y
    }
    func setX(x : CGFloat)
    {
        self.frame.origin.x = x
    }
    func setHeight(height : CGFloat)
    {
        self.frame.size.height = height
    }
    func setWidth(width : CGFloat)
    {
        self.frame.size.width = width
    }
}
