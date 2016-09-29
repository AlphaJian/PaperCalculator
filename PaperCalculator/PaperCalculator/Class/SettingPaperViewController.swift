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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTableView = SettingPaperTableView(frame: self.view.bounds, style: .plain)
        self.view.addSubview(settingTableView!)

        settingBotView = SettingBotView(frame: CGRect(x: 0, y: LCDH - 80, width: LCDW, height: 80))
settingBotView?.initUI()
        self.view.addSubview(settingBotView!)
        
        settingBotView?.addSectionHandler = {
        
        }
        
        
        
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
