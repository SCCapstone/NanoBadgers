//
//  NewAccountViewController.swift
//  NanoGirls
//
//  Created by Cara Pennington on 2/14/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//

import UIKit
import Firebase

class NewAccountViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    //creates instance of Colors class
    let colors = Colors()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
        setCurrentLevel()
    }

    
    func refresh()
    {
        //sets the background gradient
        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)
    }
    
    @IBAction func createAccountAction() {
        if let email = email.text {
            if let password = password.text {
                FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
                    if let user = user {
                        user.sendEmailVerification()
                        let alertController = UIAlertController(title: "Email Verification", message:
                        "Please Verify your email address.", preferredStyle: UIAlertControllerStyle.alert)
                        alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: { action in self.goToHomePage() } ))
                        self.present(alertController, animated: true, completion: nil)
                    }
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    
                }
            }
        }
    }
    
    func goToHomePage() {
        // Push to home page view controller
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "homePageNavigationController") as? UINavigationController
        self.present(vc!, animated: true)
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
