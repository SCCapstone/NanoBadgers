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
        
        helpText.text = "Nano-Adventures of Silver & Gold is to teach students between ages 7 and 12 about nanoscience. This app is fun and allows children to learn about nanoscience while engaging in a game which allows them to become involved in real world environmental problems such as oil spills, earthquakes, bacterial and viral infections. \nThe games starts off with a background story of Nano-Gold and Nano-Silver. After the origin story the student will move on to the first level. In each level there is a short lesson at the beginning taught by either Nano-Gold or Nano-Silver. In the lesson the student will learn about a problem that one of the superheroes is having. After the lesson the student will play a mini game to collect or gain enough nanoparticles to help out the superheroes. Once the student has earned enough nanoparticles they will move on to the review question. If the student answers the review question correctly they will move on to the next level. If they answer incorrectly they will go back to the beginning of that level and restart. \nEach teacher will have a login account. Under the teachers login account there will be student accounts with usernames. The student will use the teachers login account information to gain access to their account. Each students account will save their place in the game for next time. The teacher will be able to see how much of the game the student has completed. \n \nHow to create a new login account. \n \nHow to create a new student ID. \n \nHow to start a new game."
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
