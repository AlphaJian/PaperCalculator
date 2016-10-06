//
//  DataManager.swift
//  PaperCalculator
//
//  Created by Jian Zhang on 9/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    var papersArray = [PaperModel]()
    var paperModel = PaperModel()
    var paperNum = 0
    var paperModelTemp = PaperModel()
    
    static let shareManager = DataManager()
    

    func createSectionQuestion(numberOfQuestions : Int, score : Float, style : QuestionStyle){
        var arr = [CellQuestionModel]()
        for i in 0 ... numberOfQuestions - 1 {
            let qModel = CellQuestionModel()
            qModel.questionNo = i + 1
            qModel.score = score
            qModel.realScore = score
            
            if qModel.score >= 5 {
            qModel.questionStyle = QuestionStyle.multiScore
            } else {
            qModel.questionStyle = style
            }
            
            arr.append(qModel)
        }
        
        let sectionModel = SectionQuestionModel()
        sectionModel.cellQuestionArr = arr
        sectionModel.sectionScore = score * Float(numberOfQuestions)
        sectionModel.editStatus = QuestionStatus.none
        sectionModel.preSettingQuesScore = Int(score)
        
        if paperModel.sectionQuestionArr == nil
        {
            paperModel.sectionQuestionArr = [SectionQuestionModel]()
        }
        paperModel.sectionQuestionArr.append(sectionModel)
        paperModel.totalScore = paperModel.totalScore + sectionModel.sectionScore
    }
    
    func editCellQuestion(cellModel : CellQuestionModel, indexPath : IndexPath)
    {
        let section = paperModel.sectionQuestionArr[indexPath.section]
        
        let oldScore = section.cellQuestionArr[indexPath.row].realScore!
        
        section.cellQuestionArr[indexPath.row] = cellModel
        
        section.sectionScore = section.sectionScore - oldScore + cellModel.realScore
        paperModel.sectionQuestionArr[indexPath.section] = section
        paperModel.totalScore = paperModel.totalScore - oldScore + cellModel.realScore
        
    }
    
    func removeSectionQuestion(sectionNum : Int){
        paperModel.sectionQuestionArr.remove(at: sectionNum)
    }
    
    func mockData(){
        createSectionQuestion(numberOfQuestions: 5, score: 2, style: .yesOrNo)
//        createSectionQuestion(numberOfQuestions: 10, score: 4, style: .yesOrNo)
//        createSectionQuestion(numberOfQuestions: 4, score: 5, style: .yesOrNo)
//        createSectionQuestion(numberOfQuestions: 3, score: 15, style: .multiScore)

    }

}
