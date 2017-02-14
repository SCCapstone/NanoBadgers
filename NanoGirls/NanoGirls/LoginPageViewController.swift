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
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
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
                    if let user = user {
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "mainNavigationController") as? UINavigationController
                        self.present(vc!, animated: true)
                    }
                    if let error = error {
                        print(error.localizedDescription)
                    }
                }
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
