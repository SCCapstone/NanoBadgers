//
//  HelpPageViewController.swift
//  NanoGirls
//
//  Created by Cara Pennington on 10/18/16.
//  Copyright © 2016 NanoBadgers. All rights reserved.
//

import UIKit

class HelpPageViewController: UIViewController {


    
    let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
        // Do any additional setup after loading the view.
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func refresh()
    {
        //sets the background gradient
        
        view.backgroundColor = UIColor.clear

        let backgroundLayer = colors.gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)

    }

}
