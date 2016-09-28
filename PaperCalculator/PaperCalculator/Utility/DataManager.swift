//
//  DataManager.swift
//  PaperCalculator
//
//  Created by Jian Zhang on 9/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class DataManager: NSObject {

    var paperModel = PaperModel()
    
    static let shareManager = DataManager()
    

    func createSectionQuestion(numberOfQuestions : Int, score : Float, bolYesOrNo : Bool){
        var arr = [CellQuestionModel]()
        for i in 0 ... numberOfQuestions {
            let qModel = CellQuestionModel()
            qModel.questionNo = i + 1
            qModel.score = score
            qModel.bolYesOrNo = bolYesOrNo
            
            arr.append(qModel)
        }
        
        let sectionModel = SectionQuestionModel()
        sectionModel.cellQuestionArr = arr
        sectionModel.sectionScore = score * Float(numberOfQuestions)
        
        if paperModel.sectionQuestionArr == nil
        {
            paperModel.sectionQuestionArr = [SectionQuestionModel]()
        }
        paperModel.sectionQuestionArr.append(sectionModel)
    }
    
    func mockData(){
        createSectionQuestion(numberOfQuestions: 5, score: 2, bolYesOrNo: true)
        createSectionQuestion(numberOfQuestions: 10, score: 4, bolYesOrNo: true)
        createSectionQuestion(numberOfQuestions: 4, score: 5, bolYesOrNo: true)
        createSectionQuestion(numberOfQuestions: 2, score: 15, bolYesOrNo: false)
    }

}
