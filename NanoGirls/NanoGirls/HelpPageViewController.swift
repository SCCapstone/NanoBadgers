//
//  HelpPageViewController.swift
//  NanoGirls
//
//  Created by Cara Pennington on 10/18/16.
//  Copyright © 2016 NanoBadgers. All rights reserved.
//

import UIKit

class HelpPageViewController: UIViewController {

    @IBOutlet weak var helpText: UILabel!
    
    
    let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
        // Do any additional setup after loading the view.
        
        helpText.text = "Purpose of the game.\nNano-Adventures of Silver & Gold is to teach students between ages 7 and 12 about nanoscience. This app is fun and allows children to learn about nanoscience while engaging in a game which allows them to become involved in real world environmental problems such as oil spills, earthquakes, bacterial and viral infections. \n\nGoal of the game.\nThe games starts off with a background story of Nano-Gold and Nano-Silver. After the origin story the student will move on to the first level. In each level there is a short lesson at the beginning taught by either Nano-Gold or Nano-Silver. In the lesson the student will learn about a problem that one of the superheroes is having. After the lesson the student will play a mini game to collect or gain enough nanoparticles to help out the superheroes. Once the student has earned enough nanoparticles they will move on to the review question. If the student answers the review question correctly they will move on to the next level. If they answer incorrectly they will have to try again. \nEach student will have a log in account which can be created under create account. Each students account will save their place in the game for next time. The teacher will be able to see how much of the game the student has completed by going into the students personal account. \n \nHow to create a new login account.\nGo to the home page and click create account. You will need a valid email address.\n\n How to start a new game.\nTo restart the levels you can simply click on a level that has already been completed."
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
