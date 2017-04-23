//
//  LevelViewController.swift
//  NanoGirls
//
//  Created by Cara Pennington on 3/26/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//  questionNavigationController

import UIKit
import Firebase

class LevelViewController: UIViewController {
    
    var currentLevel: Double = 0.0
    let colors = Colors()

    @IBOutlet weak var level11: UIButton!
    @IBOutlet weak var level12: UIButton!
    @IBOutlet weak var level13: UIButton!
    @IBOutlet weak var level1ReviewQuestion: UIButton!
    
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
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "level1.3NavigationController") as? UINavigationController
        self.present(vc!, animated: true)
    }
    
    @IBAction func level1ReviewQuestion(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "reviewQuestionNavigationController") as? UINavigationController
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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCurrentLevel()
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
    
    // Get the current level of the user
    func fetchCurrentLevel() {
        let dbRef = FIRDatabase.database().reference()
        
        if let auth = FIRAuth.auth() {
            if let user = auth.currentUser {
                dbRef.child("users").child(user.uid).child("currentLevel").observeSingleEvent(of: .value, with: {
                    (snapshot) in
                    if let level = snapshot.value as? Double {
                        self.currentLevel = level
                        
                        if self.currentLevel < 1.1 {
                            self.level11.isEnabled = false
                            self.level12.isEnabled = false
                            self.level13.isEnabled = false
                            self.level1ReviewQuestion.isEnabled = false
                            print("level 0.0 (origin story)")
                        }
                        else if self.currentLevel < 1.2 {
                            self.level11.isEnabled = true
                            self.level12.isEnabled = false
                            self.level13.isEnabled = false
                            self.level1ReviewQuestion.isEnabled = false
                            print("level 1.1")
                        }
                        else if self.currentLevel < 1.3 {
                            self.level11.isEnabled = true
                            self.level12.isEnabled = true
                            self.level13.isEnabled = false
                            self.level1ReviewQuestion.isEnabled = false
                            print("level 1.2")
                            
                        }
                        else if self.currentLevel < 1.4 {
                            self.level11.isEnabled = true
                            self.level12.isEnabled = true
                            self.level13.isEnabled = true
                            self.level1ReviewQuestion.isEnabled = false
                            print("level 1.3")
                            
                        }
                        else {
                            self.level11.isEnabled = true
                            self.level12.isEnabled = true
                            self.level13.isEnabled = true
                            self.level1ReviewQuestion.isEnabled = true
                            print("level 1.4 (review question)")
                            
                        }
                    }
                })
            }
        }
    }



}
