//
//  LevelViewController.swift
//  NanoGirls
//
//  Created by Cara Pennington on 3/26/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {

    @IBOutlet weak var originStoryButton: UIButton!
    @IBOutlet weak var level1Button: UIButton!


    // Create instance of Colors class
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
