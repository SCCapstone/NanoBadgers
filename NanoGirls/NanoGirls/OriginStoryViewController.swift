//
//  OriginStoryViewController.swift
//  NanoGirls
//
//  Created by Elizabeth Pruett on 2/28/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//

import UIKit
import Firebase

class OriginStoryViewController: UIViewController {
    
    var timesClicked:Int!
    
    @IBOutlet weak var myView: UIView!

    @IBOutlet weak var ngImageView: UIImageView!

    @IBOutlet weak var speechBubbleImageView: UIImageView!
    let colors = Colors()
    
    
    @IBAction func backButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "levelNavigationController") as? UINavigationController
        self.present(vc!, animated: true)
    }
    
    @IBAction func signOut(_ sender: Any) {
        print("sign out button tapped")
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth!.signOut()
            FIRAuth.auth()?.addStateDidChangeListener { auth, user in
                if user != nil {
                    print("User is signed in.")
                } else {
                    print("User is signed out.")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "homePageNavigationController") as? UINavigationController
                    self.present(vc!, animated: true)
                }
            }
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError)")
        } catch {
            print("Unknown error.")
        }
    }
    
    
    //This button allows the reader to click through the characters' dialogue, and finally, navigate to the next screen.
    @IBAction func nextButton(_ sender: Any) {
        timesClicked = timesClicked + 1
        if (timesClicked == 1)
        {
            //gold talking
            speechBubbleImageView.image = #imageLiteral(resourceName: "originstory2")
            ngImageView.image = UIImage(named: "PROF2")
        }
        if (timesClicked == 2)
        {
            //silver talking
           speechBubbleImageView.image = #imageLiteral(resourceName: "originstory3")
            ngImageView.image = UIImage(named: "PROF1")
        }
        if (timesClicked == 3)
        {
           //silver talking
           speechBubbleImageView.image = #imageLiteral(resourceName: "originstory4")
            ngImageView.image = UIImage(named: "PROF1")
        }
        if (timesClicked == 4)
        {
           speechBubbleImageView.image = #imageLiteral(resourceName: "originstory5")
            ngImageView.image = UIImage(named: "PROF2")
        }
        if (timesClicked == 5)
        {
           speechBubbleImageView.image = #imageLiteral(resourceName: "originstory6")
            ngImageView.image = UIImage(named: "PROF1")
        }
        if (timesClicked == 6)
        {
           speechBubbleImageView.image = #imageLiteral(resourceName: "originstory7")
            ngImageView.image = UIImage(named: "PROF2")
        }
        if (timesClicked == 7)
        {
            speechBubbleImageView.image = #imageLiteral(resourceName: "originstory8")
            ngImageView.image = UIImage(named: "PROF1")
        }
        if (timesClicked == 8)
        {
            performSegue(withIdentifier: "beginGame", sender: self)
        }
    }
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        refresh()
        setCurrentLevel()
        timesClicked = 0
    }
    
    
    
    func refresh()
    {
        //sets the background gradient
        myView.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)
    
    }

    let lev = 0.0
    var currentLevel: Double = 0.0
    
    func setCurrentLevel() {
        let dbRef = FIRDatabase.database().reference()
        
        if let auth = FIRAuth.auth() {
            if let user = auth.currentUser {
                dbRef.child("users").child(user.uid).child("currentLevel").observeSingleEvent(of: .value, with: {
                    (snapshot) in
                    if let level = snapshot.value as? Double {
                        self.currentLevel = level
                        
                        if self.currentLevel > 0.0 {
                            print("Already been to this level")
                        }
                        else {
                            dbRef.child("users").child(user.uid).updateChildValues(["currentLevel":self.lev])
                        }
                            
                        
                    }
                })
            }
        }
    }


}
