//
//  ReviewPaperTableView.swift
//  PaperCalculator
//
//  Created by Jian Zhang on 9/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class ReviewPaperTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    var model = DataManager.shareManager.paperModel.copySelf()
    
    var singleMarkHandler : ReturnWithThreeParmsBlock!
    var multiMarkHandler : ReturnWithThreeParmsBlock!
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(QuestionTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.separatorStyle = .none
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
        cell.selectionStyle = .none
        let cellArr = model.sectionQuestionArr[indexPath.section].cellQuestionArr as [CellQuestionModel]
        
        cell.clearCell()
        
        if indexPath.row * 2 + 1 < cellArr.count
        {
            cell.initUI(arr: [cellArr[indexPath.row * 2], cellArr[indexPath.row * 2 + 1]], index: indexPath)
        }
        else
        {
            cell.initUI(arr: [cellArr[indexPath.row * 2]], index: indexPath)
        }
        
        cell.btnHandler = {(newIndex, oldIndex, obj) -> Void in
            if self.singleMarkHandler != nil
            {
                self.singleMarkHandler(newIndex, oldIndex, obj)
            }
        }
        
        cell.multiBtnHandler = {(newIndex, oldIndex, obj) -> Void in
            if self.multiMarkHandler != nil
            {
                self.multiMarkHandler(newIndex, oldIndex, obj)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 40))
        view.backgroundColor = UIColor.white
        let lbl = UILabel(frame: CGRect(x: 20, y: 0, width: view.frame.width - 20, height: 40))
        lbl.text = "第 \(section + 1) 大题, 得分\(model.sectionQuestionArr[section].sectionScore!)"
        lbl.textColor = darkBlue
        view.addSubview(lbl)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    

}
