/**
 *  HomePageViewController.swift
 *  NanoGirls
 *  Basic homepage with logo, login and create account options, and a help button. 
 *
 *  Created by Elizabeth Pruett on 10/17/16.
 * Copyright © 2016 NanoBadgers. All rights reserved.
**/

import UIKit
import Firebase


class HomePageViewController: UIViewController
{

    @IBOutlet weak var HelpButton: UIButton!
    
    
    @IBAction func loginButton(_ sender: Any) {
        if FIRAuth.auth()?.currentUser != nil {
            // User is signed in.
            // Send to level page.
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "levelNavigationController") as? UINavigationController
            self.present(vc!, animated: true)
        } else {
            // No user is signed in.
            // Send to login page.
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginNavigationController") as? UINavigationController
            self.present(vc!, animated: true)        }
    }
    
    //creates instance of Colors class for background gradient
    let colors = Colors()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        refresh()
        
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

