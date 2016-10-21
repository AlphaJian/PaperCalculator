//
//  SettingPaperViewController.swift
//  PaperCalculator
//
//  Created by appledev018 on 9/29/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class SettingPaperViewController: UIViewController {

    var settingTableView : SettingPaperTableView?
    var settingBotView: SettingBotView?
    let botViewHeight: CGFloat = 90
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        settingTableView = SettingPaperTableView(frame: CGRect(x: 0, y: 0, width: LCDW, height: LCDH - botViewHeight), style: .plain)
        self.view.addSubview(settingTableView!)
        

        settingBotView = SettingBotView(frame: CGRect(x: 0, y: LCDH - botViewHeight, width: LCDW, height: botViewHeight))
settingBotView?.initUI()
        self.view.addSubview(settingBotView!)
        
        settingBotView?.addSectionHandler = {
         DataManager.shareManager.createSectionQuestion(numberOfQuestions: 2, score: 2, style: .yesOrNo)
        self.settingTableView?.reloadData()
        }
        
        settingBotView?.doneHandler = {
        self.backToPrevious()
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backToPrevious(){
        DataManager.shareManager.getTotalScore()
        DataManager.shareManager.paperModelTemp = DataManager.shareManager.paperModel.copySelf()
        _ = self.navigationController?.popViewController(animated: true)
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
