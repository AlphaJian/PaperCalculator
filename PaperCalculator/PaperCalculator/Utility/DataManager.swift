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
    var paperNum = 1
    var paperModelTemp = PaperModel()
    
    //statistics
    var numOf90plus = 0
    var numOf80plus = 0
    var numOf70plus = 0
    var numOf60plus = 0
    var numOf60off = 0

    
    
    
    var bestArr = [PaperModel]()
    var lastArr = [PaperModel]()
    
    
    
    
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
        sectionModel.sectionScore = 0
        sectionModel.editStatus = QuestionStatus.none
        sectionModel.preSettingQuesScore = Int(score)
        
        if paperModel.sectionQuestionArr == nil
        {
            paperModel.sectionQuestionArr = [SectionQuestionModel]()
        }
        paperModel.sectionQuestionArr.append(sectionModel)
//        paperModel.totalScore = paperModel.totalScore + sectionModel.sectionScore
    }
    
    func editCellQuestion(cellModel : CellQuestionModel, indexPath : IndexPath)
    {
        let section = paperModel.sectionQuestionArr[indexPath.section]
        
        let oldScore = section.cellQuestionArr[indexPath.row].realScore!
        
        section.cellQuestionArr[indexPath.row] = cellModel
        
        section.sectionScore = section.sectionScore - oldScore + cellModel.realScore
        paperModel.sectionQuestionArr[indexPath.section] = section
        paperModel.totalScore = paperModel.totalScore - oldScore + cellModel.realScore
        getGrade()
    }
    
    func getTotalScore(){
        if paperModel.sectionQuestionArr.count > 0{
        for i in 0...paperModel.sectionQuestionArr.count - 1 {
            for j in 0...paperModel.sectionQuestionArr[i].cellQuestionArr.count - 1 {
             paperModel.sectionQuestionArr[i].sectionScore = paperModel.sectionQuestionArr[i].sectionScore + (paperModel.sectionQuestionArr[i].cellQuestionArr[j] as CellQuestionModel).score
            }
            
        paperModel.totalScore = paperModel.totalScore + paperModel.sectionQuestionArr[i].sectionScore
        getGrade()
        }
        }
    }
    
    func getGrade() {
        if paperModel.totalScore >= 80 {
            paperModel.grade = "优秀"
        } else if paperModel.totalScore >= 70 {
            paperModel.grade = "良好"
        } else if paperModel.totalScore >= 60 {
            paperModel.grade = "及格"
        } else  {
            paperModel.grade = "需努力"
        }
        
    }
    
    func getStatistics() {
        if papersArray.count > 0 {
            numOf90plus = 0
            numOf80plus = 0
            numOf70plus = 0
            numOf60plus = 0
            numOf60off = 0
            
        for i in 0...papersArray.count - 1 {
            if papersArray[i].totalScore >= 90 {
            numOf90plus = numOf90plus + 1
            } else if papersArray[i].totalScore >= 80 {
                numOf80plus = numOf80plus + 1
            } else if papersArray[i].totalScore >= 70 {
                numOf70plus = numOf70plus + 1
            } else if papersArray[i].totalScore >= 60 {
                numOf60plus = numOf60plus + 1
            } else {
                numOf60off = numOf60off + 1
            }
        }
        }
    }
    
//            for i in 0...papersArray.count - 1 {
//                for j in 0...papersArray[i].sectionQuestionArr.count - 1 {
//                    for k in 0...papersArray[i].sectionQuestionArr[j].cellQuestionArr.count - 1 {
//                        var sumOfQuestionScore = 0
//                        var sumOfRealScore = 0
//                        sumOfQuestionScore = sumOfQuestionScore.papersArray[i].sectionQuestionArr[j].cellQuestionArr[k].score
//                    
//                    }
//                
//                
//                }
//            }
            
        
    func getQuestionStates (section: Int, row: Int) -> (score: Float, realScore: Float, faultNum: Int) {
        var sumOfQuestionScore : Float = 0
        var sumOfRealScore : Float = 0
        var faultNum = 0
        
        for i in 0...papersArray.count - 1 {
        let paper = papersArray[i]
            if section != paper.sectionQuestionArr.count {
        let section = paper.sectionQuestionArr[section]
                let question = section.cellQuestionArr[row]
                
                sumOfQuestionScore = sumOfQuestionScore + question.score
                sumOfRealScore = sumOfRealScore + question.realScore
                if question.score != question.realScore {
                    faultNum = faultNum + 1
                }
            }

            }
        return (sumOfQuestionScore, sumOfRealScore, faultNum)
    }
    
    func getRank () {
    var bestMark : Float = 0
    var lastMark : Float = 100
        
    
        for i in 0...papersArray.count - 1{
        papersArray[i].name = "\(i+1)号"
        
            if papersArray[i].totalScore > bestMark {
                bestArr.removeAll()
                bestMark = papersArray[i].totalScore
                bestArr.append(papersArray[i])
            } else if papersArray[i].totalScore == bestMark {
                bestArr.append(papersArray[i])
            }
            
            if papersArray[i].totalScore < lastMark {
                lastArr.removeAll()
                lastMark = papersArray[i].totalScore
                lastArr.append(papersArray[i])
            } else if papersArray[i].totalScore == lastMark {
                lastArr.append(papersArray[i])
            }
            
        
        }
    
    
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

