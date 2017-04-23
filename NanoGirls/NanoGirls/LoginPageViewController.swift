//
//  LoginPageViewController.swift
//  NanoGirls
//
//  Created by Cara Pennington on 10/18/16.
//  Copyright © 2016 NanoBadgers. All rights reserved.
//

import UIKit
import Firebase

class LoginPageViewController: UIViewController {
    

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //creates instance of Colors class
    let colors = Colors()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
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
    
    @IBAction func loginButtonAction() {
        if let email = email.text {
            
            if let password = password.text {
           
                FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
//                    if let user = user {
                    if let user = FIRAuth.auth()?.currentUser {
                        if !user.isEmailVerified {
                            let alertVC = UIAlertController(title: "Error", message: "Sorry. Your email adress has not yet been verified. Would you like us to send another verification email to \(String(describing: self.email.text)).", preferredStyle: .alert)
                            let alertActionOkay = UIAlertAction(title: "Okay", style: .default) { (_) in
                                user.sendEmailVerification(completion: nil)
                            }
                            let alertActionCancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                            alertVC.addAction(alertActionOkay)
                            alertVC.addAction(alertActionCancel)
                            self.present(alertVC, animated: true, completion: nil)
                        }
                        else {
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "levelNavigationController") as? UINavigationController
                            self.present(vc!, animated: true)
                            print("Email verified. Signing in...")
                        }
                    }
                }
            }
        }
    }
    
}
