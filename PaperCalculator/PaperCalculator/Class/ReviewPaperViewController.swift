//
//  ReviewPaperViewController.swift
//  PaperCalculator
//
//  Created by Jian Zhang on 9/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class ReviewPaperViewController: UIViewController {

    var popMarkView : PopSelectionScoreView?
    
    var paperSC : UIScrollView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initSC()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.title = "\(DataManager.shareManager.paperNum)号 \(DataManager.shareManager.paperModel.totalScore!)分  " + DataManager.shareManager.paperModel.grade
    }
    
    func initSC(){
        let model = DataManager.shareManager.paperModel.copySelf()

        if model.sectionQuestionArr.count == 0
        {
            return
        }
        
        paperSC = UIScrollView(frame: CGRect(x: 0, y: 64, width: LCDW, height: LCDH - 64))
        paperSC.backgroundColor = UIColor.white
        paperSC.isPagingEnabled = true
        paperSC.showsVerticalScrollIndicator = false
        paperSC.contentSize = CGSize(width: paperSC.width() * CGFloat(DataManager.shareManager.paperModel.sectionQuestionArr.count), height: 0)
        var originX : CGFloat = 0

        for index in 0...model.sectionQuestionArr.count - 1 {
            let tableview = ReviewPaperTableView(frame: CGRect(x: originX, y: 10, width: paperSC.width(), height: paperSC.height() - 10), style: .plain)
            tableview.items = model.sectionQuestionArr[index].cellQuestionArr
            tableview.index = index + 1
            if index == model.sectionQuestionArr.count - 1
            {
                tableview.bolLast = true
            }
            paperSC.addSubview(tableview)
            originX = tableview.right()
            
            tableview.singleMarkHandler = {(newIndex, oldIndex, obj) -> Void in
                DataManager.shareManager.editCellQuestion(cellModel: obj as! CellQuestionModel, indexPath:                 IndexPath(item: newIndex.row, section: index))
                self.refreshTableView(tb: tableview, index : index)
            }
            
            tableview.multiMarkHandler = {(newIndex, oldIndex, obj) -> Void in
                self.popMarkView = PopSelectionScoreView(frame: CGRect(x: 0, y: 64, width: LCDW, height: LCDH - 64))
                self.popMarkView?.initUI(score: (obj as! CellQuestionModel).score)
                self.view.addSubview(self.popMarkView!)
                self.popMarkView?.btnHandler = {(score) -> Void in
                    self.popMarkView?.removeFromSuperview()
                    self.popMarkView = nil
                    
                    (obj as! CellQuestionModel).realScore = score as! Float
                    DataManager.shareManager.editCellQuestion(cellModel: obj as! CellQuestionModel, indexPath: IndexPath(item: newIndex.row, section: index))
                    self.refreshTableView(tb: tableview, index : index)
                }
            }
            
            tableview.nextPaperHandler = {
                DataManager.shareManager.getGrade()
                DataManager.shareManager.paperNum = DataManager.shareManager.paperNum + 1
                self.title = "\(DataManager.shareManager.paperNum)号 \(DataManager.shareManager.paperModel.totalScore!)分  " + DataManager.shareManager.paperModel.grade
                self.paperSC.removeFromSuperview()
                self.paperSC = nil
                self.initSC()
            }
        }
        self.view.addSubview(paperSC)
    }
    
    func refreshTableView(tb : ReviewPaperTableView, index : Int){
//        self.paperTableView?.model =
        
        DispatchQueue.main.async {
            self.title = "\(DataManager.shareManager.paperNum)号 \(DataManager.shareManager.paperModel.totalScore!)分  " + DataManager.shareManager.paperModel.grade
            tb.items = DataManager.shareManager.paperModel.copySelf().sectionQuestionArr[index].cellQuestionArr
            tb.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
