//
//  LevelViewController.swift
//  NanoGirls
//
//  Created by Cara Pennington on 3/26/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//

import UIKit
import Firebase

class LevelViewController: UIViewController {

    @IBAction func originStory(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "storyBoardNavigavtionController") as? UINavigationController
        self.present(vc!, animated: true)
    }
    
    @IBAction func level11(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "level1Part1NavigationController") as? UINavigationController
        self.present(vc!, animated: true)
    }
    
    @IBAction func level12(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "level1.2NavigationController") as? UINavigationController
        self.present(vc!, animated: true)
    }
    
    @IBAction func level13(_ sender: Any) {
    }
    
    var currentLevel: Double = 0.0

    // Create instance of Colors class
    let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCurrentLevel()
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
    
    // Get the current level of the user
    func fetchCurrentLevel() {
        let dbRef = FIRDatabase.database().reference()
        
        if let auth = FIRAuth.auth() {
            if let user = auth.currentUser {
                dbRef.child("users").child(user.uid).child("currentLevel").observeSingleEvent(of: .value, with: {
                    (snapshot) in
                    if let level = snapshot.value as? Double {
                        self.currentLevel = level
                    }
                })
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
