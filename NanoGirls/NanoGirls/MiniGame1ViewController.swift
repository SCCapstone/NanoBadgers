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
    @IBOutlet var ScoreIndicator : UILabel?
    
    var xSpeed : CGFloat!
    var ySpeed : CGFloat!
    var HEIGHT : CGFloat!
    var WIDTH : CGFloat!
    var Score : Int = 0


    
    var clock  : Timer!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            paddle.center.x = touch.location(in: self.view).x
            
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            paddle.center.x = touch.location(in: self.view).x
        }
    }
    func updateScoreIndicatior(){
        ScoreIndicator?.text = "\(Score)"
    }
    
    func addScore(){
        Score = Score + 1
    }
    func CPU(){
        paddle.center.y = HEIGHT - 50
        ball.center = CGPoint(x:ball.center.x+xSpeed, y:ball.center.y + ySpeed)
        if(ball.center.x < 15)
        {
            xSpeed = -xSpeed
        }
        if(ball.center.x > WIDTH)
        {
            xSpeed = -xSpeed
        }
        if(ball.center.y < 200)
        {
            ySpeed = -ySpeed
        }
        if(ball.center.y > HEIGHT+100)
        {
            ySpeed = -ySpeed
        }
        if (ball.frame).intersects(paddle.frame)        {
            ySpeed = -ySpeed
            Score = Score + 1
        }
        updateScoreIndicatior()
    }
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        let screenSize = UIScreen.main.bounds
        WIDTH = screenSize.width
        HEIGHT = screenSize.height

        
        updateScoreIndicatior()
        clock = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.CPU), userInfo: nil, repeats: true)
        xSpeed = 10
        ySpeed = 10
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

