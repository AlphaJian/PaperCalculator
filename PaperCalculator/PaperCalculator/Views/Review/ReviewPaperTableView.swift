//
//  ReviewPaperTableView.swift
//  PaperCalculator
//
//  Created by Jian Zhang on 9/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class ReviewPaperTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var items = [CellQuestionModel]()
    var index = 0
    var bolLast = false
    var singleMarkHandler : ReturnWithThreeParmsBlock!
    var multiMarkHandler : ReturnWithThreeParmsBlock!
    var nextPaperHandler : ButtonTouchUpBlock!
    
    var totalRow = 0
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if bolLast == true
        {
            if items.count % 2 == 0
            {
                totalRow = items.count / 2 + 1
            }
            else
            {
                totalRow = items.count / 2 + 2
            }
        }
        else
        {
            if items.count % 2 == 0
            {
                totalRow = items.count / 2
            }
            else
            {
                totalRow = items.count / 2 + 1
            }
        }
        return totalRow
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! QuestionTableViewCell
        cell.selectionStyle = .none
        
        cell.clearCell()
        
        if indexPath.row == totalRow - 1 && bolLast == true
        {
            cell.initLastCell()
            cell.nextPaperHandler = {
                if self.nextPaperHandler != nil {
                    self.nextPaperHandler!()
                }
                
            }
            return cell
        }
        else
        {
            if indexPath.row * 2 + 1 < items.count
            {
                cell.initUI(arr: [items[indexPath.row * 2], items[indexPath.row * 2 + 1]], index: indexPath)
            }
            else
            {
                cell.initUI(arr: [items[indexPath.row * 2]], index: indexPath)
            }
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
        lbl.text = "第 \(index) 大题, 得分\(DataManager.shareManager.paperModel.sectionQuestionArr[index - 1].sectionScore!)"
        lbl.font = mediumFont
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
