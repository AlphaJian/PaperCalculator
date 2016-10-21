//
//  ReportViewController.swift
//  PaperCalculator
//
//  Created by appledev018 on 10/11/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {
    var questionReportTableView : QuestionReportTableView?
    override func viewDidLoad() {
        super.viewDidLoad()

        var sum: Float = 0
        
        questionReportTableView = QuestionReportTableView(frame: self.view.bounds, style: .plain)
        self.view.addSubview(questionReportTableView!)
        
        for i in 0...DataManager.shareManager.papersArray.count - 1 {
            let paperModel = DataManager.shareManager.papersArray[i]
            sum = sum + paperModel.totalScore
        }
        
        let average = sum/Float(DataManager.shareManager.paperNum - 1)
        
        self.title = "平均分 \(average) 分"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
