//
//  PapleModel.swift
//  Calculator
//
//  Created by appledev018 on 9/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import Foundation
import UIKit

class PaperModel : NSObject
{
    var sectionQuestionArr : [SectionQuestionModel]!
    var totalScore : Float!
}

class SectionQuestionModel: NSObject {
    var sectionScore : Float!
    var cellQuestionArr : [CellQuestionModel]!
    
    var editStatus : QuestionStatus!
}

class CellQuestionModel : NSObject
{
    var questionNo : Int!
    var score : Float!
    var bolYesOrNo : Bool!
}

enum QuestionStatus {
    case Finish
    case Editing
    case None
}
