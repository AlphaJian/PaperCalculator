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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func  numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noneCell") as! NoneSettingCell
        
        cell.clearCell()
        
        cell.initUI()
        
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
    }
    
    
}
