//
//  OriginStoryViewController.swift
//  NanoGirls
//
//  Created by Elizabeth Pruett on 12/3/16.
//  Copyright © 2016 NanoBadgers. All rights reserved.
//

import UIKit

class OriginStoryViewController: UIViewController {

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
