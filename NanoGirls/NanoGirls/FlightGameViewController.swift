//
//  FlightGameViewController.swift
//  NanoGirls
//
//  Created by John Chandler on 4/01/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import AVFoundation

class FlightGameViewController: UIViewController{
    
    @IBOutlet var player: UIImageView!
    
    @IBOutlet var ScoreIndicator: UILabel!
   
    @IBOutlet var TimeIndicator: UILabel!
    
    var Score : Int = 0
    var audioPlayer : AVAudioPlayer!
    
    var TotalTime : Int = 30
    var xSpeed : CGFloat!
    var ySpeed : CGFloat!
    
    var SPEED : CGFloat!
    var HEIGHT : CGFloat!
    var WIDTH : CGFloat!
    var enemyCount : Int!
    var goodCount : Int!
    
    var clock : Timer!
    var GameTimer : Timer!
    var timer : Timer!
    var SpawnTimer : Timer!
    var SpawnTimer2: Timer!
    var movementTimer: Timer!
    var views = [UIView]()
    var views2 = [UIView]()
    
    /**************
    *
     playSound function: Plays a sound when called.
    *
    *****/
    
    func playSound(){
        
        let audioFilePath = Bundle.main.path(forResource: "SoundAttempt1", ofType: "mp3")
        
        if(audioFilePath != nil)
        {
            let audioFileUrl = NSURL.fileURL(withPath: audioFilePath!)
            audioPlayer = try! AVAudioPlayer(contentsOf: audioFileUrl)
            audioPlayer.play()
            
        }
        else
        {
            print("Error @ sound")
        }
    }
    
    /*************
    *   Down Button
        Moves player controlled unit downwards (+y direction).
    *
    *****/
    
    @IBAction func addY(_ sender: Any)
    {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(FlightGameViewController.addYHelperDown), userInfo: nil, repeats: true)
    }
    
    func addYHelperDown()
    {
        if(player.center.y <= (HEIGHT - player.frame.height/2))
        {
            player.center = CGPoint(x:player.center.x, y:player.center.y + SPEED)
            
        }
    }
    @IBAction func addYstop(_ sender: Any)
    {
        timer.invalidate()
    }
    @IBAction func stopMovingDown1(_ sender: Any)
    {
        timer.invalidate()
    }
    @IBAction func stopMovingDown2(_ sender: Any)
    {
        timer.invalidate()
    }
    
    /***************
    *
        Up Button
        Moves player controlled unit upwards (-y direction).
    *
    *****/

    @IBAction func subY(_ sender: Any)
    {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(FlightGameViewController.addYHelperUp), userInfo: nil, repeats: true)
    }
    
    func addYHelperUp()
    {
        if(player.center.y >= (player.frame.height/2) + HEIGHT/10)
        {
            player.center = CGPoint(x:player.center.x, y:player.center.y - SPEED)
        }
    }

    @IBAction func subYcancel(_ sender: Any)
    {
       timer.invalidate()
    }
    
    @IBAction func stopMovingUp1(_ sender: Any)
    {
        timer.invalidate()
    }
   
    @IBAction func stopMovingUp2(_ sender: Any)
    {
        timer.invalidate()
    }
    /************
    *
        Right Button
        Moves player controlled unit to the right (+x direction).
    *
    *****/
    
    @IBAction func addX(_ sender: Any)
    {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(FlightGameViewController.addXHelperDown), userInfo: nil, repeats: true)
    }
    func addXHelperDown()
    {
        if(player.center.x <= (WIDTH - player.frame.width/2))
        {
            player.center = CGPoint(x:player.center.x + SPEED, y:player.center.y)
        }
    }
    
    @IBAction func addXstop(_ sender: Any)
    {
        timer.invalidate()
    }
    @IBAction func stopMovingRight1(_ sender: Any)
    {
        timer.invalidate()
    }
    
    @IBAction func stopMovingRight2(_ sender: Any)
    {
        timer.invalidate()
    }
    
    /*************
    *
        Left Button
        Moves player controlled unit to the left (-x direction).
    *
    ******/
    @IBAction func subX(_ sender: Any)
    {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(FlightGameViewController.subtractXHelperDown), userInfo: nil, repeats: true)
    }
    func subtractXHelperDown()
    {
        if(player.center.x >= (player.frame.width/2))
        {
            player.center = CGPoint(x:player.center.x - SPEED, y:player.center.y)
        }
    }
    
    @IBAction func subXstop(_ sender: Any)
    {
        timer.invalidate()
    }
    @IBAction func stopMovingLeft1(_ sender: Any)
    {
        timer.invalidate()
    }
    @IBAction func stopMovingLeft2(_ sender: Any)
    {
        timer.invalidate()
    }
    
    /***************
    *
     moveStuffDown function: moves each element in views (bad guys) and views2 (good guys)
        down the screen. (+ y direction).
     
        if object descends past a certain point, remove object.
    *
    ******/
    func moveStuffDown()
    {
        for i in 0..<views.count
        {
            if(views[i].center.y > UIScreen.main.bounds.height + 10)
            {
                views[i].removeFromSuperview()
            }
            else
            {
                views[i].center = CGPoint(x:views[i].center.x, y:views[i].center.y + SPEED)
            }
        }
        for i in 0..<views2.count
        {
            if(views2[i].center.y > UIScreen.main.bounds.height + 10)
            {
                views2[i].removeFromSuperview()
            }
            else
            {
                views2[i].center = CGPoint(x:views2[i].center.x, y:views2[i].center.y + SPEED)
            }
        }
    }
    
    /****************
    *
     CPU function: if the player controlled unit intersects another object (good or bad guy), then
     remove object from screen, play a sound, add to or subtract from the score, then increase or decrease
     speed accordingly.
    *
    *****/
    func CPU()
    {
        for i in 0..<views.count
        {
            if(player.frame.intersects(views[i].frame))
            {
                views[i].removeFromSuperview()
                views[i].center = CGPoint(x:-90,y:-90)
                enemyCount = enemyCount - 1
                playSound()
                if(SPEED > 4){
                    SPEED = SPEED - 1
                }
            }
            
        }
        for i in 0..<views2.count
        {
            if(player.frame.intersects(views2[i].frame))
            {
                views2[i].removeFromSuperview()
                views2[i].center = CGPoint(x:-90,y:-90)
                goodCount = goodCount - 1
                playSound()
                if(SPEED < 10)
                {
                    SPEED = SPEED + 1
                }
                Score = Score + 1
            }
        }
        updateScoreIndicatior()
    }
    
    /***********
    *
     function updateTime: updates the time text on screen.
    *
    ******/
    func updateTime()
    {
        TimeIndicator?.text = "\(TotalTime)"
    }
    /************
    *
     function updateScoreindicator: updates the score text on screen
    *
    *****/
    func updateScoreIndicatior()
    {
        ScoreIndicator?.text = "\(Score)"
    }
    
    /************
    *
     function decreaseTotalTime: Decreases the total time (how long left in the game) until it reaches
     0. Then send a message, and end the round.
    *
    ******/
    func decreaseTotalTime()
    {
        if(TotalTime != 0)
        {
            TotalTime = TotalTime - 1
            updateTime()
        }
        else{
            GameTimer?.invalidate()
            let alertController = UIAlertController(title: "Level 1", message:
                "OUT OF TIME!!!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: { action in self.performSegue(withIdentifier: "Round2", sender: nil) }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    /***********
    *
     function randomColor: I'm not sure what this does ?
    *
    ****/
    func randomColor() -> UIColor
    {
        
        let red = CGFloat(54)
        let green = CGFloat(54)
        let blue = CGFloat(54)
        return UIColor(red:red, green: green, blue:blue, alpha: 1.0)
        
    }
    
    /***********
    *
     function spawnEnemy: Spawns enemy at a random x coordinate above the screen.
     the enemy is a red square. Then adds enemy to the subView and the insert array
    *
    ****/
    func spawnEnemy()
    {
        
        
   //     var bufferside : CGFloat
        var inputx : CGFloat
        var xCord : Int
        
        inputx = WIDTH - 50
  //      bufferside = WIDTH/8
        
        xCord = Int(arc4random_uniform(UInt32(inputx + 25))) //+(UInt32(bufferside)))
        
        if(enemyCount < 10)
        {
            let enemy: UIView = UIView(frame: CGRect(x: 0, y:0, width:50, height:50))
            enemy.backgroundColor = UIColor.red
            enemy.center = CGPoint(x: xCord, y: -10)
            
            self.view.addSubview(enemy)
            views.insert(enemy, at: Int(enemyCount))
            enemyCount = enemyCount + 1
            
        }
    }
    
    /*********
    *
     function spawnGood: Spawns a good guy at a random x coordinate above the screen.
     the good guy is a blue square. Adds the enemy to the subview and the insert array
    *
    ***/
    func spawnGood()
    {
       // var bufferside : CGFloat
        var inputx : CGFloat
        var xCord : Int
        
        inputx = WIDTH - 50
       // bufferside = WIDTH / 8
        xCord = Int(arc4random_uniform(UInt32(inputx + 25))) //+(UInt32(bufferside)))
        
        if(goodCount < 10)
        {
            let good: UIView = UIView(frame: CGRect(x: 0, y:0, width:50, height:50))
            good.backgroundColor = UIColor.blue
            good.center = CGPoint(x: xCord, y: -10)
            
            self.view.addSubview(good)
            views2.insert(good, at: Int(goodCount))
            goodCount = goodCount + 1
        }
    }
    
    /*************
    *
     viewDidLoad function : Does stuff
    *
    ***/
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let screenSize = UIScreen.main.bounds
        WIDTH = screenSize.width
        HEIGHT = screenSize.height
        clock = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.CPU), userInfo: nil, repeats: true)
        xSpeed = 0
        ySpeed = 0
        SPEED = 1
        enemyCount = 0
        goodCount = 0
        
        movementTimer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector (self.moveStuffDown), userInfo: nil, repeats: true)
        SpawnTimer = Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector (self.spawnEnemy), userInfo: nil, repeats: true)
        SpawnTimer2 = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector (self.spawnGood), userInfo: nil, repeats: true)
        GameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.decreaseTotalTime), userInfo: nil, repeats: true)
        
        // :)
        
    }
    
}








