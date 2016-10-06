//
//  ReviewPaperViewController.swift
//  PaperCalculator
//
//  Created by Jian Zhang on 9/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class ReviewPaperViewController: UIViewController {

    var paperTableView : ReviewPaperTableView?
    var popMarkView : PopSelectionScoreView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.title = "总分：\(DataManager.shareManager.paperModel.totalScore!)"

        paperTableView = ReviewPaperTableView(frame: self.view.bounds, style: .plain)
        self.view.addSubview(paperTableView!)
        
        paperTableView?.singleMarkHandler = {(newIndex, oldIndex, obj) -> Void in
            DataManager.shareManager.editCellQuestion(cellModel: obj as! CellQuestionModel, indexPath: newIndex as! IndexPath)
            self.refreshTableView(index: oldIndex as! IndexPath)
        }
        
        paperTableView?.multiMarkHandler = {(newIndex, oldIndex, obj) -> Void in
            self.popMarkView = PopSelectionScoreView(frame: CGRect(x: 0, y: 64, width: LCDW, height: LCDH - 64))
            self.popMarkView?.initUI(score: (obj as! CellQuestionModel).score)
            self.view.addSubview(self.popMarkView!)
            self.popMarkView?.btnHandler = {(score) -> Void in
                self.popMarkView?.removeFromSuperview()
                self.popMarkView = nil
                
                (obj as! CellQuestionModel).realScore = score as! Float
                DataManager.shareManager.editCellQuestion(cellModel: obj as! CellQuestionModel, indexPath: newIndex as! IndexPath)
                self.refreshTableView(index: oldIndex as! IndexPath)
            }
        }
        paperTableView?.nextPaperHandler = {
            self.paperTableView?.model = DataManager.shareManager.paperModelTemp.copySelf()
            
            self.paperTableView?.reloadData()
        }
        
    }
    
    func refreshTableView(index : IndexPath){
        self.paperTableView?.model = DataManager.shareManager.paperModel.copySelf()
        DispatchQueue.main.async {
            self.title = "总分：\(DataManager.shareManager.paperModel.totalScore!)"
            self.paperTableView?.reloadRows(at: [index], with: .none)
            self.paperTableView?.reloadSections(IndexSet(integer: index.section), with: .none)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
