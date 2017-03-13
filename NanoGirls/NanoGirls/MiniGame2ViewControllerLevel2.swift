//
//  MiniGame2ViewControllerLevel2.swift
//  NanoGirls
//
//  Created by Spencer Nelson on 3/13/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class MiniGame2ViewControllerLevel2: UIViewController{
    
    @IBOutlet var player : UIImageView!
    @IBOutlet var UP : UIImageView!
    @IBOutlet var DOWN : UIImageView!
    @IBOutlet var LEFT : UIImageView!
    @IBOutlet var RIGHT : UIImageView!
    @IBOutlet var ScoreIndicator : UILabel?
    @IBOutlet var TimeIndicator : UILabel?
    
    
    var Score : Int = 0
    var audioPlayer : AVAudioPlayer!
    
    var TotalTime : Int = 60
    var xSpeed : CGFloat!
    var ySpeed : CGFloat!
    
    var SPEED : CGFloat!
    var HEIGHT : CGFloat!
    var WIDTH : CGFloat!
    var enemyCount : CGFloat!
    var goodCount : CGFloat!
    
    var clock : Timer!
    var GameTimer : Timer!
    var timer : Timer!
    var SpawnTimer : Timer!
    var SpawnTimer2: Timer!
    var views = [UIView]()
    var views2 = [UIView]()
    
    
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
            print("ahhhhhhh")
        }
    }
    
    
    
        //UP BUTTON
    @IBAction func addY(_ sender: AnyObject) {
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(MiniGame2ViewController.addYHelperUp), userInfo: nil, repeats: true)
    }
    func addYHelperUp()
    {
        if(player.center.y >= (player.frame.height/2) + HEIGHT/10)
        {
            player.center = CGPoint(x:player.center.x, y:player.center.y - SPEED)
        }
    }
    
    @IBAction func addYStop(_ sender: AnyObject) {
        timer.invalidate()
        
    }

        
        //DOWN BUTTON
    @IBAction func subtractYStop(_ sender: AnyObject) {
        timer.invalidate()
    }
    @IBAction func subtractY(_ sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(MiniGame2ViewController.subtractYHelperDown), userInfo: nil, repeats: true)
    }
    func subtractYHelperDown()
    {
        if(player.center.y <= (HEIGHT - player.frame.height/2))
        {
            player.center = CGPoint(x:player.center.x, y:player.center.y + SPEED)
            
        }
    }

        
        //RIGHT BUTTON
    @IBAction func addXStop(_ sender: AnyObject) {
        timer.invalidate()
    }
    func addXHelperDown()
    {
        if(player.center.x <= (WIDTH - player.frame.width/2))
        {
            player.center = CGPoint(x:player.center.x + SPEED, y:player.center.y)
        }
    }
    @IBAction func addX(_ sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(MiniGame2ViewController.addXHelperDown), userInfo: nil, repeats: true)
    }
    

        
        //LEFT BUTTON
    
    @IBAction func subtractXStop(_ sender: AnyObject) {
        timer.invalidate()
    }
    @IBAction func subtractX(_ sender: AnyObject) {
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(MiniGame2ViewController.subtractXHelperDown), userInfo: nil, repeats: true)
        
    }
    func subtractXHelperDown()
    {
        if(player.center.x >= (player.frame.width/2))
        {
            player.center = CGPoint(x:player.center.x - SPEED, y:player.center.y)
        }
    }

    
        
        func CPU(){
            
            
            
            
        }
        
        func updateTime(){
            
        }
        func updateScoreIndicator(){
            
            
        }
        func decreaseTotalTime(){
            
        }
        
        func SpawnEnemy(){
            
        }
        func SpawnPoint(){
            
        }
        
        override func viewDidLoad(){
            super.viewDidLoad()
            let ScreenSize = UIScreen.main.bounds
            WIDTH = ScreenSize.width
            HEIGHT = ScreenSize.height
            goodCount = 0
            enemyCount = 0
            clock = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(self.CPU), userInfo: nil, repeats: true)
            SPEED = WIDTH/100
            SpawnTimer = Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector (self.SpawnEnemy), userInfo: nil, repeats: true)
            SpawnTimer2 = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector (self.SpawnPoint), userInfo: nil, repeats: true)
            GameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.decreaseTotalTime), userInfo: nil, repeats: true)
            
        }
        
    }
    
    
    

