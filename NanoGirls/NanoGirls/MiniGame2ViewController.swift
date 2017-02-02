//
//  MiniGame2ViewController.swift
//  NanoGirls
//
//  Created by Spencer Nelson on 1/31/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

class MiniGame2ViewController: UIViewController{
    
    
    
    @IBOutlet var player : UIImageView!
    @IBOutlet var UP : UIImageView!
    @IBOutlet var DOWN : UIImageView!
    @IBOutlet var LEFT : UIImageView!
    @IBOutlet var RIGHT : UIImageView!
    
    
    var xSpeed : CGFloat!
    var ySpeed : CGFloat!
    
    var HEIGHT : CGFloat!
    var WIDTH : CGFloat!
    
    var clock : Timer!
    
    var timer : Timer!
    
    @IBAction func addY(_ sender: Any) {

        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(MiniGame2ViewController.addYHelper), userInfo: nil, repeats: true)
    }
    func addYHelper()
    {
        player.center = CGPoint(x:player.center.x, y:player.center.y + 1)

    }
    @IBAction func StopMoving2(_ sender: Any) {
    timer.invalidate()
    }
    @IBAction func StopMoving(_sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func addYStop(_ sender: Any) {
        timer.invalidate()
    
    }
    
        func addToY()
        {
            ySpeed = 10
    }
        func CPU(){
            player.center = CGPoint(x:player.center.x + xSpeed, y:player.center.y + ySpeed)
            
        }
        override func viewDidLoad()
        {
            super.viewDidLoad()
            let screenSize = UIScreen.main.bounds
            WIDTH = screenSize.width
            HEIGHT = screenSize.height
            clock = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.CPU), userInfo: nil, repeats: true)
            xSpeed = 0
            ySpeed = 0
        }
    
}

    
    
    
    
    
    

