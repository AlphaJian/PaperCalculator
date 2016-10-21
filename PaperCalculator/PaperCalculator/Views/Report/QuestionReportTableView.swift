//
//  QuestionReportTableView.swift
//  PaperCalculator
//
//  Created by appledev018 on 10/11/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class QuestionReportTableView: UITableView,  UITableViewDelegate, UITableViewDataSource {

    //
    //  ReviewPaperTableView.swift
    //  PaperCalculator
    //
    //  Created by Jian Zhang on 9/28/16.
    //  Copyright © 2016 apple. All rights reserved.
    //
    
   
        
        var model = DataManager.shareManager.paperModel.copySelf()
        
        var singleMarkHandler : ReturnWithThreeParmsBlock!
        var multiMarkHandler : ReturnWithThreeParmsBlock!
        var nextPaperHandler : ButtonTouchUpBlock!
        
        override init(frame: CGRect, style: UITableViewStyle) {
            super.init(frame: frame, style: style)
            self.delegate = self
            self.dataSource = self
            self.register(QuestionReportTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
            self.separatorStyle = .none
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("")
        }
        
        func  numberOfSections(in tableView: UITableView) -> Int {
            return model.sectionQuestionArr.count + 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
            if section == model.sectionQuestionArr.count {
                return 1
            } else {
                 let sectionModel = model.sectionQuestionArr[section]
                return sectionModel.cellQuestionArr.count
            }
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == DataManager.shareManager.paperModel.sectionQuestionArr.count  {
            let cell = RankReportTableViewCell()
                cell.initUI()
                return cell
            
            } else {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! QuestionReportTableViewCell
            cell.selectionStyle = .none
            cell.clearCell()
            
            cell.initUI(index: indexPath)
                return cell
            
            }
            
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
            view.backgroundColor = UIColor.white
            let lbl = UILabel(frame: CGRect(x: 20, y: 0, width: view.frame.width - 20, height: 50))
           if section == model.sectionQuestionArr.count {
            lbl.text = "其他"
           } else {
            lbl.text = "第 \(section + 1) 大题"
            }
            lbl.font = mediumFont
            lbl.textColor = darkBlue
            view.addSubview(lbl)
            
            return view
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            if indexPath.section == model.sectionQuestionArr.count {
            return 90
            } else {
            
            
                return 40
            }
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
        
        
    


}
