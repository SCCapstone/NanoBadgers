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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
