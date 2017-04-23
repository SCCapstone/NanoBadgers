//
//  LeesonPage2ViewController.swift
//  NanoGirls
//
//  Created by Spencer Nelson on 3/21/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//

import UIKit
import Firebase

class LessonPage2ViewController: UIViewController {

    var timesClicked:Int!
    
    @IBOutlet weak var speechBubbleImageView: UIImageView!
    
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
            speechBubbleImageView.image = #imageLiteral(resourceName: "level4")
        }
        
        if (timesClicked == 2)
        {
            performSegue(withIdentifier: "beginGame", sender: self)
        }

    }
    
    //creates instance of Colors class
    let colors = Colors()
//    let level = 1.2

    override func viewDidLoad() {
        super.viewDidLoad()

        refresh()
        setCurrentLevel()
        timesClicked = 0

        
        

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
        
/*        // Set current level to 1.2
        let dbRef = FIRDatabase.database().reference()
        
        if let auth = FIRAuth.auth() {
            if let user = auth.currentUser {
                dbRef.child("users").child(user.uid).updateChildValues(["currentLevel":level])
            }
        }
 */
    }

    let lev = 1.2
    var currentLevel: Double = 0.0
    
    func setCurrentLevel() {
        let dbRef = FIRDatabase.database().reference()
        
        if let auth = FIRAuth.auth() {
            if let user = auth.currentUser {
                dbRef.child("users").child(user.uid).child("currentLevel").observeSingleEvent(of: .value, with: {
                    (snapshot) in
                    if let level = snapshot.value as? Double {
                        self.currentLevel = level
                        
                        if self.currentLevel >= 1.2 {
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
