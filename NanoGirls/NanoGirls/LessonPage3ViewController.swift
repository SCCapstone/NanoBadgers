//
//  LessonPage3ViewController.swift
//  NanoGirls
//
//  Created by Spencer Nelson on 4/4/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class LessonPage3ViewController: UIViewController {
    
    @IBOutlet weak var lessonText3: UILabel!
    
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
    
    
    //creates instance of Colors class
    let colors = Colors()
    //let level = 1.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresh()
        setCurrentLevel()
        
        lessonText3.text = "Wow! You dodged the Silver particles! Good job. \n OH NO! Theres been a giant spill in the so the amount of silver is huge! Help us collect more nutrients!"
        
        /*"Hey Spencer! When hand soaps and lotions get into the drain and run off into the ocean, silver (Ag) nanoparticles are introduced to the coastal zone. Silver is dangerous to a lot of organisms there, including dinoflagellates! Dinoflagellates are phytoplankton that have the ability to propel themselves in any direction - and they need nutrients like nitrogen (N), phosphorous (P), and iron (Fe) to stay healthy! \nHelp the dinoflagellates consume nutrients by moving them around the screen. Remember to avoid silver, or the dinoflagellates will become sluggish and slow!"*/
        
        
        
        
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
        
/*        // Set current level to 1.3
        let dbRef = FIRDatabase.database().reference()
        
        if let auth = FIRAuth.auth() {
            if let user = auth.currentUser {
                dbRef.child("users").child(user.uid).updateChildValues(["currentLevel":level])
            }
        }
*/
    }
    
    let lev = 1.3
    var currentLevel: Double = 0.0
    
    func setCurrentLevel() {
        let dbRef = FIRDatabase.database().reference()
        
        if let auth = FIRAuth.auth() {
            if let user = auth.currentUser {
                dbRef.child("users").child(user.uid).child("currentLevel").observeSingleEvent(of: .value, with: {
                    (snapshot) in
                    if let level = snapshot.value as? Double {
                        self.currentLevel = level
                        
                        if self.currentLevel >= 1.3 {
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
