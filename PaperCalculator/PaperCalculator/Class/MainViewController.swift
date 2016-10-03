//
//  MainViewController.swift
//  PaperCalculator
//
//  Created by appledev018 on 9/28/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let view = NumView(frame: CGRect(x: 50, y: 200, width: 100, height: 30))
//        
//        view.initUI(num: 5)
//        self.view.addSubview(view)
        
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
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
