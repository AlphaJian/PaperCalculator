//
//  ReviewPaperTableView.swift
//  PaperCalculator
//
//  Created by Jian Zhang on 9/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class ReviewPaperTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    var model = DataManager.shareManager.paperModel
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self

        self.register(QuestionTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func  numberOfSections(in tableView: UITableView) -> Int {
        return model.sectionQuestionArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionModel = model.sectionQuestionArr[section]
        if sectionModel.cellQuestionArr.count % 2 == 0
        {
            return sectionModel.cellQuestionArr.count / 2
        }
        else
        {
            return sectionModel.cellQuestionArr.count / 2 + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! QuestionTableViewCell
        
        let cellArr = model.sectionQuestionArr[indexPath.section].cellQuestionArr as [CellQuestionModel]
        
        cell.clearCell()
        
        if indexPath.row * 2 + 1 < cellArr.count
        {
            cell.initUI(questionArr: [cellArr[indexPath.row * 2], cellArr[indexPath.row * 2 + 1]])
        }
        else
        {
            cell.initUI(questionArr: [cellArr[indexPath.row * 2]])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 40))
        view.backgroundColor = UIColor.red
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    

}
