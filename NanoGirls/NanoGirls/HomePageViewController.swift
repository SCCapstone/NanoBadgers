//
//  HomePageViewController.swift
//  NanoGirls
//  Top: NanoGirls logo - Login button, help button.
//
//  Created by Elizabeth Pruett on 10/17/16.
//  Copyright © 2016 NanoBadgers. All rights reserved.
//

import UIKit



class HomePageViewController: UIViewController
{
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var HelpButton: UIButton!
    
    
    //creates instance of Colors class
    let colors = Colors()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        refresh()
        
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
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


    
