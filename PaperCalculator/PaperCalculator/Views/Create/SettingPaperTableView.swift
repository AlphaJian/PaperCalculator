//
//  ReviewPaperTableView.swift
//  PaperCalculator
//
//  Created by Jian Zhang on 9/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class SettingPaperTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var model = DataManager.shareManager.paperModel
    var numSection = 0
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(NoneSettingCell.classForCoder(), forCellReuseIdentifier: "noneCell")
        self.register(EditSettingCell.classForCoder(), forCellReuseIdentifier: "editCell")
        self.separatorStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func  numberOfSections(in tableView: UITableView) -> Int {
        return model.sectionQuestionArr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if model.sectionQuestionArr[indexPath.section].editStatus == .editing {
            let cell = tableView.dequeueReusableCell(withIdentifier: "editCell") as! EditSettingCell
            
            cell.clearCell()
            
            cell.selectionStyle = .none
            
            cell.initUI(questionNum: (model.sectionQuestionArr[indexPath.section].cellQuestionArr as NSArray).count , markNum: model.sectionQuestionArr[indexPath.section].preSettingQuesScore , index: indexPath)
            cell.btnHandler = {
                self.reloadData()
            }
            
            return cell
        } else if model.sectionQuestionArr[indexPath.section].editStatus == QuestionStatus.none {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "noneCell") as! NoneSettingCell
            
            cell.clearCell()
             cell.selectionStyle = .none
            
            cell.initUI(questionNum: (model.sectionQuestionArr[indexPath.section].cellQuestionArr as NSArray).count , markNum: 5, index: indexPath)
            
            cell.btnHandler = {
                self.reloadData()
            }
            return cell
        
        } else {
            
            let cell = UITableViewCell(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            return cell
            
        }
    
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 40))
        let titleLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 100, height: 20))
        titleLabel.text = "第 \(section + 1) 大题"
        titleLabel.textColor = UIColor.white
        view.addSubview(titleLabel)
        
        view.backgroundColor = UIColor.darkGray
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if model.sectionQuestionArr[indexPath.section].editStatus == .editing {
            return CGFloat((model.sectionQuestionArr[indexPath.section].cellQuestionArr as NSArray).count) * 70 + 20
        }else if model.sectionQuestionArr[indexPath.section].editStatus == .finish {
            return 0
        } else {
            return 150
        }
    }
    
    
}
