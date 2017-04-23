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



    @IBOutlet weak var nanoGirlImageView: UIImageView!
    
    @IBOutlet weak var speechBubbleImageView: UIImageView!
    
    let colors = Colors()
    var timesClicked:Int!
    
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
    
    @IBAction func nextButton(_ sender: Any) {
        timesClicked = timesClicked + 1
        if (timesClicked == 1)
        {
            //gold talking
            speechBubbleImageView.image = #imageLiteral(resourceName: "level2")
        }

        if (timesClicked == 2)
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
        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)
    }
    
    let lev = 1.1
    var currentLevel: Double = 0.0
    
    func setCurrentLevel() {
        let dbRef = FIRDatabase.database().reference()
        
        if let auth = FIRAuth.auth() {
            if let user = auth.currentUser {
                dbRef.child("users").child(user.uid).child("currentLevel").observeSingleEvent(of: .value, with: {
                    (snapshot) in
                    if let level = snapshot.value as? Double {
                        self.currentLevel = level

                        if self.currentLevel >= 1.1 {
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
