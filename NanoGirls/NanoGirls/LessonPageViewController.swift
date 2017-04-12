//
//  LessonPageViewController.swift
//  NanoGirls
//
//  Created by Elizabeth Pruett on 11/16/16.
//  Copyright © 2016 NanoBadgers. All rights reserved.

//<a href="https://icons8.com/web-app/398/Play">Play icon credits</a>

//

import UIKit
import Firebase

class LessonPageViewController: UIViewController {

    @IBOutlet weak var lessonText: UILabel!
    //creates instance of Colors class
    let colors = Colors()
    let level = 1.1
    

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        refresh()
        
        lessonText.text = "Hey Gamer! Dinoflagellates are phytoplankton that have the ability to propel themselves in any direction - and they need nutrients like nitrogen (N), phosphorous (P), and iron (Fe) to stay healthy! \nHelp the dinoflagellates consume nutrients by moving them around the screen. "
        
        /*"Hey Spencer! When hand soaps and lotions get into the drain and run off into the ocean, silver (Ag) nanoparticles are introduced to the coastal zone. Silver is dangerous to a lot of organisms there, including dinoflagellates! Dinoflagellates are phytoplankton that have the ability to propel themselves in any direction - and they need nutrients like nitrogen (N), phosphorous (P), and iron (Fe) to stay healthy! \nHelp the dinoflagellates consume nutrients by moving them around the screen. Remember to avoid silver, or the dinoflagellates will become sluggish and slow!"*/
        
        
        
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
        
        // Set current level to 1.1
        let dbRef = FIRDatabase.database().reference()
        
        if let auth = FIRAuth.auth() {
            if let user = auth.currentUser {
                dbRef.child("users").child(user.uid).updateChildValues(["currentLevel":level])
            }
        }
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
