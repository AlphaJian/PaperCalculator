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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DataManager.shareManager.mockData()
        paperTableView = ReviewPaperTableView(frame: self.view.bounds, style: .plain)
        self.view.addSubview(paperTableView!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
