//
//  ViewController.swift
//  NanoGirls
//
//  Created by Spencer Nelson on 10//16.
//  Copyright © 2016 NanoBadgers. All rights reserved.
//  random note to test commits

import UIKit



class MiniGame1ViewController: UIViewController {
    
    @IBOutlet var paddle : UIImageView!
    @IBOutlet var ball : UIImageView!
    
    var xSpeed : CGFloat!
    var ySpeed : CGFloat!
    


    
    var clock  : Timer!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            paddle.center = touch.location(in: self.view)
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
//            paddle.center = touch.location(in: self.view)
            paddle.center.x = touch.location(in: self.view).x
        }
    }
    
    func CPU(){
        ball.center = CGPoint(x:ball.center.x+xSpeed, y:ball.center.y + ySpeed)
        if(ball.center.x < 15)
        {
            xSpeed = -xSpeed
        }
        if(ball.center.x > 300)
        {
            xSpeed = -xSpeed
        }
        if(ball.center.y < 15)
        {
            ySpeed = -ySpeed
        }
        if(ball.center.y > 600)
        {
            ySpeed = -ySpeed
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize = UIScreen.main.bounds
        let WIDTH = screenSize.width
        let HEIGHT = screenSize.height

        clock = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.CPU), userInfo: nil, repeats: true)
        xSpeed = 10
        ySpeed = 10
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

