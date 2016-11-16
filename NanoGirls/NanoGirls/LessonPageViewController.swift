//
//  LessonPageViewController.swift
//  NanoGirls
//
//  Created by Elizabeth Pruett on 11/16/16.
//  Copyright © 2016 NanoBadgers. All rights reserved.
//

import UIKit

class LessonPageViewController: UIViewController {

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
