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

    
    func copySelf() -> PaperModel{
        let newModel = PaperModel()
        
        var newsectionArr = [SectionQuestionModel]()
        for obj in sectionQuestionArr {
            let newSection = SectionQuestionModel()
            newSection.preSettingQuesScore = obj.preSettingQuesScore
            newSection.sectionScore = obj.sectionScore
            newSection.editStatus = obj.editStatus
            
            var newCellArr = [CellQuestionModel]()
            for item in obj.cellQuestionArr {
                let newCell = CellQuestionModel()
                newCell.questionNo = item.questionNo
                newCell.score = item.score
                newCell.realScore = item.realScore
                newCell.questionStyle = item.questionStyle
                
                newCellArr.append(newCell)
            }
            newSection.cellQuestionArr = newCellArr
            newsectionArr.append(newSection)
        }
        newModel.totalScore = totalScore
        newModel.sectionQuestionArr = newsectionArr
        
        return newModel
    }
}

class SectionQuestionModel: NSObject {
    var sectionScore : Float!
    var cellQuestionArr : [CellQuestionModel]!
    var preSettingQuesScore : Int!
    var editStatus : QuestionStatus!
}

class CellQuestionModel : NSObject
{
    var questionNo : Int!
    var score : Float!
    var realScore : Float!
    var questionStyle : QuestionStyle!
    
    override init(){
        questionNo = 0
        score = 0
        realScore = 0
        questionStyle = .yesOrNo
    }
}

enum QuestionStatus {
    case finish
    case editing
    case none
}

enum QuestionStyle
{
    case yesOrNo
    case multiScore
}
