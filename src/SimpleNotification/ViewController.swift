//
//  ViewController.swift
//  SimpleNotification
//
//  Created by Hiroaki Fujisawa on 2016/10/11.
//  Copyright © 2016年 xinext. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    
    var adMgr = AdModMgr()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        adMgr.initManager(pvc:self, cv: mainView)

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        adMgr.dispAdView(pos: AdModMgr.DISP_POSITION.BOTTOM)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

