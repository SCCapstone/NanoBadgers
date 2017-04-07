//
//  MiniGame2ViewControllerLevel3.swift
//  NanoGirls
//
//  Created by Spencer Nelson on 4/5/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class MiniGame2ViewControllerLevel3: UIViewController {
    
    @IBOutlet var player : UIImageView!
    @IBOutlet var UP : UIImageView!
    @IBOutlet var DOWN : UIImageView!
    @IBOutlet var LEFT : UIImageView!
    @IBOutlet var RIGHT : UIImageView!
    @IBOutlet var ScoreIndicator : UILabel?
    @IBOutlet var TimeIndicator : UILabel?
    
    
    var Score : Int = 0
    var audioPlayer : AVAudioPlayer!
    
    var TotalTime : Int = 10
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
        for i in 0..<views.count
        {
            if(player.frame.intersects(views[i].frame))
            {
                views[i].removeFromSuperview()
                views[i].center = CGPoint(x:-90,y:-90)
                playSound()
                if(SPEED > 4){
                    SPEED = SPEED - 2
                }
            }
            
        }
        for i in 0..<views2.count
        {
            if(player.frame.intersects(views2[i].frame))
            {
                views2[i].removeFromSuperview()
                views2[i].center = CGPoint(x:-90,y:-90)
                playSound()
                if(SPEED < 10)
                {
                    SPEED = SPEED + 2
                }
                Score = Score + 1
            }
            
        }
        updateScoreIndicatior()
    }
    
    func updateTime(){
        TimeIndicator?.text = "\(TotalTime)"
    }
    func updateScoreIndicatior(){
        ScoreIndicator?.text = "\(Score)"
    }
    
    func decreaseTotalTime(){
        if(TotalTime != 0)
        {
            TotalTime = TotalTime - 1
            updateTime()
        }
        else{
            GameTimer?.invalidate()
            let alertController = UIAlertController(title: "Level 1", message:
                "OUT OF TIME!!!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: { action in self.performSegue(withIdentifier: "question", sender: nil) }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func SpawnEnemy(){
        var bufferside : CGFloat
        var inputx : CGFloat
        var inputy : UInt32
        var buffertop : UInt32
        var xCord : Int
        var yCord : Int
        
        inputx = WIDTH*5/8
        bufferside = WIDTH / 8
        inputy = UInt32(HEIGHT) * 3 / 4
        buffertop = UInt32(HEIGHT) / 8
        xCord = Int(arc4random_uniform(UInt32(inputx))+(UInt32(bufferside)))
        yCord = Int(arc4random_uniform(UInt32(inputy))+(UInt32(buffertop)))
        
        if(enemyCount < 10)
        {
            let enemy: UIView = UIView(frame: CGRect(x: 0, y:0, width:50, height:50))
            enemy.backgroundColor = UIColor.red
            enemy.center = CGPoint(x: xCord, y: yCord)
            
            self.view.addSubview(enemy)
            views.insert(enemy, at: Int(enemyCount))
            enemyCount = enemyCount + 1
            
        }
        
        
    }
    func SpawnPoint(){
        
        
        
        var bufferside : CGFloat
        var inputx : CGFloat
        var inputy : UInt32
        var buffertop : UInt32
        var xCord : Int
        var yCord : Int
        
        
        inputx = WIDTH*5/8
        bufferside = WIDTH / 8
        inputy = UInt32(HEIGHT) * 5 / 8
        buffertop = UInt32(HEIGHT) / 8
        xCord = Int(arc4random_uniform(UInt32(inputx))+(UInt32(bufferside)))
        yCord = Int(arc4random_uniform(UInt32(inputy))+(UInt32(buffertop)))
        
        if(goodCount < 10)
        {
            let good: UIView = UIView(frame: CGRect(x: 0, y:0, width:50, height:50))
            good.backgroundColor = UIColor.blue
            good.center = CGPoint(x: xCord, y: yCord)
            
            self.view.addSubview(good)
            views2.insert(good, at: Int(goodCount))
            goodCount = goodCount + 1
            
        }
        
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
