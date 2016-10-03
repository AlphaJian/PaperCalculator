//
//  BlockDefination.swift
//  BusinessOS
//
//  Created by Jian Zhang on 12/2/15.
//  Copyright © 2015 PwC. All rights reserved.
//

import UIKit

typealias ButtonTouchUpBlock = () -> Void
typealias ButtonTouchUpWithParmBlock = (AnyObject) -> Void
typealias ButtonTouchUpReturnInt = (Int) -> Void

typealias CellTouchUpBlock = (NSIndexPath, AnyObject) -> Void

typealias ReturnBlock = (AnyObject) -> Void

typealias ReturnCGRectBlock = (CGRect) -> Void

typealias ReturnWithTwoParmsBlock = (AnyObject,AnyObject) -> Void
typealias ReturnWithThreeParmsBlock = (AnyObject,AnyObject,AnyObject) -> Void
typealias ReturnWithFourParmsBlock = (AnyObject,AnyObject,AnyObject,AnyObject) -> Void

let LCDW : CGFloat = UIScreen.main.bounds.size.width
let LCDH : CGFloat = UIScreen.main.bounds.size.height
let textColor : UIColor = UIColor.init(red: 50, green: 50, blue: 50, alpha: 1)
let buttonColor : UIColor = UIColor.init(red: 50, green: 50, blue: 50, alpha: 1)

let pfont:UIFont = UIFont.init(name: "Roboto-Regular", size: 13)!
class BlockDefination: NSObject {

}
