//
//  MainViewController.swift
//  PaperCalculator
//
//  Created by appledev018 on 9/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

   
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var btn3: UIButton!
    
    @IBOutlet weak var btn4: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btn1.layer.cornerRadius = 10
        btn2.layer.cornerRadius = 10
        btn3.layer.cornerRadius = 10
        btn4.layer.cornerRadius = 10
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    @IBAction func pi(_ sender: AnyObject) {
       
        let vc = ReviewPaperViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBAction func setting(_ sender: AnyObject) {
        let vc = SettingPaperViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func checkReport(_ sender: AnyObject) {
        let vc = ReportViewController()
        DataManager.shareManager.getRank()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func checkCharts(_ sender: AnyObject) {
    
        let vc = ChartsViewController()
        DataManager.shareManager.getStatistics()
        self.navigationController?.pushViewController(vc, animated: true)
    
    
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
