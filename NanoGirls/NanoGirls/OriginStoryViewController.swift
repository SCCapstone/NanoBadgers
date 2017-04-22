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
    @IBOutlet weak var originLabel: UILabel!
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
    
    @IBAction func nextButton(_ sender: Any) {
        timesClicked = timesClicked + 1
        if (timesClicked == 1)
        {
            originLabel.text = "You’re right! Well, we started off as two normal scientists studying nano-particles. One day, chemicals from a large industrial company spilled into a nearby body of water."
            ngImageView.image = UIImage(named: "PROF2")
        }
        if (timesClicked == 2)
        {
            originLabel.text = "This was a good opportunity to test our prototype nano-particles, Gold and Silver, to clean toxins from water. But when Gold tried to add the particles…"
            ngImageView.image = UIImage(named: "PROF1")
        }
        if (timesClicked == 3)
        {
            originLabel.text = "I fell in! Trying to help me out, Silver fell in as well. We’re not sure what happened next…but hours later we managed to get ourselves out of the water and go home."
            ngImageView.image = UIImage(named: "PROF2")
        }
        if (timesClicked == 4)
        {
            originLabel.text = "Back at the lab, I heard a noise, and somehow in my fright- disappeared! Only I didn’t actually disappear; I shrunk down to nano-size. Moments later, I returned to normal, but found my skin had a metallic sheen and my vision was much better."
            ngImageView.image = UIImage(named: "PROF1")
        }
        if (timesClicked == 5)
        {
            originLabel.text = "We ran some tests, and discovered I had these changes too. We realized we had new powers from the nano-particles, and that was how we survived the toxic water!"
            ngImageView.image = UIImage(named: "PROF2")
        }
        if (timesClicked == 6)
        {
            originLabel.text = "Now, we are scientists and superheroes Nano Silver and Nano Gold by night! Will you help us as we try to use our new powers for good? "
            ngImageView.image = UIImage(named: "PROF1")
        }
        if (timesClicked == 7)
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
        
        originLabel.text = "Hey Gold, we should tell the gamer about how we became the Nano Girls! "

        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    func refresh()
    {
        //sets the background gradient
        myView.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)
        
        // Set current level to 0.0
/*        let dbRef = FIRDatabase.database().reference()
        
        if let auth = FIRAuth.auth() {
            if let user = auth.currentUser {
                dbRef.child("users").child(user.uid).updateChildValues(["currentLevel":currentLevel])
            }
        }
 */
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
