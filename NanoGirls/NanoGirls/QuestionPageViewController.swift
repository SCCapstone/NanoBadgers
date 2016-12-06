//
//  QuestionPageViewController.swift
//  NanoGirls
//
//  Created by John Chandler on 10/23/16.
//  Copyright © 2016 NanoBadgers. All rights reserved.
//

import UIKit


import UIKit

class QuestionPageViewController: UIViewController {
    
        let colors = Colors()
    
    @IBAction func correctAnswer(_ sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Level 1", message:
            "Correct!", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func incorrect1(_ sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Level 1", message:
            "Sorry, incorrect!", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Try again", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func incorrect2(_ sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Level 1", message:
            "Sorry, incorrect!", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Try again", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
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
