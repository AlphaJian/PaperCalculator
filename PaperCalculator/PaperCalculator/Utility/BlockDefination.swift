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
typealias ButtonTouchUpReturnInt = (Int, Int) -> Void

typealias CellTouchUpBlock = (NSIndexPath, AnyObject) -> Void

typealias ReturnBlock = (AnyObject) -> Void

typealias ReturnCGRectBlock = (CGRect) -> Void

typealias ReturnWithTwoParmsBlock = (AnyObject,AnyObject) -> Void
typealias ReturnWithThreeParmsBlock = (AnyObject,AnyObject,AnyObject) -> Void
typealias ReturnWithFourParmsBlock = (AnyObject,AnyObject,AnyObject,AnyObject) -> Void

let LCDW : CGFloat = UIScreen.main.bounds.size.width
let LCDH : CGFloat = UIScreen.main.bounds.size.height
let lightBlue : UIColor = UIColor.init(red: 0, green: 106/255, blue: 191/255, alpha: 1)
let darkBlue : UIColor = UIColor.init(red: 17/255, green: 62/255, blue: 142/255, alpha: 1)
let lightRed : UIColor = UIColor.init(red: 224/255, green: 109/255, blue: 86/255, alpha: 1)
let darkRed : UIColor = UIColor.init(red: 219/255, green: 49/255, blue: 156/255, alpha: 1)
let mediumFont = UIFont.systemFont(ofSize: 18, weight: UIFontWeightMedium)

let pfont:UIFont = UIFont.init(name: "Roboto-Regular", size: 13)!
class BlockDefination: NSObject {

}
