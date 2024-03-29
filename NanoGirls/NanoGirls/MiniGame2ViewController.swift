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
import AVFoundation

class MiniGame2ViewController: UIViewController{
    
    
    
    @IBOutlet var player : UIImageView!

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
            if(TotalTime != 0){
                let audioFileUrl = NSURL.fileURL(withPath: audioFilePath!)
                audioPlayer = try! AVAudioPlayer(contentsOf: audioFileUrl)
                audioPlayer.play()
            }
        }
        else
        {
            print("ahhhhhhh")
        }
        
        
    }
    
    
    //DOWN BUTTON
    @IBAction func subtractYStop(_ sender: AnyObject) {
        timer.invalidate()
    }
    @IBAction func subtractY(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(MiniGame2ViewController.subtractYHelperDown), userInfo: nil, repeats: true)
    }
    @IBAction func stopMovingUp(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func stopMovingUp2(_ sender: Any) {
        timer.invalidate()
    }
    func subtractYHelperDown()
    {
        if(player.center.y <= (HEIGHT - player.frame.height/2))
        {
        player.center = CGPoint(x:player.center.x, y:player.center.y + SPEED)
    
        }
    }
    
    
    //LEFT BUTTON
    
    @IBAction func subtractXStop(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func subtractX(_ sender: Any) {
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(MiniGame2ViewController.subtractXHelperDown), userInfo: nil, repeats: true)
       
    }
    
    @IBAction func stopMovingLeft(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func stopMovingLeft2(_ sender: Any) {
        timer.invalidate()
    }
    func subtractXHelperDown()
    {
        if(player.center.x >= (player.frame.width/2))
        {
            player.center = CGPoint(x:player.center.x - SPEED, y:player.center.y)
        }
    }
    
    //right button
    @IBAction func addXStop(_ sender: Any) {
        timer.invalidate()
    }
    func addXHelperDown()
    {
        if(player.center.x <= (WIDTH - player.frame.width/2))
        {
        player.center = CGPoint(x:player.center.x + SPEED, y:player.center.y)
        }
    }
    @IBAction func addX(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(MiniGame2ViewController.addXHelperDown), userInfo: nil, repeats: true)
    }
    @IBAction func stopMovingRight(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func stopMovingRight2(_ sender: Any) {
        timer.invalidate()
    }
    //UP BUTTON
    @IBAction func addY(_ sender: Any) {

        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(MiniGame2ViewController.addYHelperUp), userInfo: nil, repeats: true)
    }
    func addYHelperUp()
    {
        if(player.center.y >= (player.frame.height/2) + HEIGHT/10)
        {
        player.center = CGPoint(x:player.center.x, y:player.center.y - SPEED)
        }
    }
    @IBAction func StopMovingDown2(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func StopMoving(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func addYStop(_ sender: Any) {
        timer.invalidate()
    
    }
    
    func CPU(){
        //player.center = CGPoint(x:player.center.x + xSpeed, y:player.center.y + ySpeed)

        for i in 0..<views.count
        {
            if(player.frame.intersects(views[i].frame))
            {
                views[i].removeFromSuperview()
                views[i].center = CGPoint(x:-90,y:-90)
                playSound()
                
            }
            if(i > 4)
            {
                
                views2[i-5].removeFromSuperview()
                views2[i-5].center = CGPoint(x:-90,y:-90)
                
                
            }
            
        }
        for i in 0..<views2.count
        {
            if(player.frame.intersects(views2[i].frame))
            {
                views2[i].removeFromSuperview()
                views2[i].center = CGPoint(x:-90,y:-90)
                playSound()
            
                Score = Score + 1
            }
            if(i > 4)
            {
                
                views2[i-5].removeFromSuperview()
                views2[i-5].center = CGPoint(x:-90,y:-90)
                
                
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
                "Time is up!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default,handler: { action in self.performSegue(withIdentifier: "Round2", sender: nil) }))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    
    func randomColor() -> UIColor{
        
        let red = CGFloat(54)
        let green = CGFloat(54)
        let blue = CGFloat(54)
        return UIColor(red:red, green: green, blue:blue, alpha: 1.0)
        
    }
    
    
    func spawnEnemy(){
    
        
        var bufferside : CGFloat
        var inputx : CGFloat
        var inputy : UInt32
        var buffertop : UInt32
        var xCord : Int
        var yCord : Int
        
        inputx = WIDTH*5/8
        bufferside = WIDTH / 8
        //inputy = UInt32(HEIGHT) * 5 / 8
        inputy = UInt32(HEIGHT) / 2
        //buffertop = UInt32(HEIGHT) / 8
        buffertop = UInt32(HEIGHT) / 4
        xCord = Int(arc4random_uniform(UInt32(inputx))+(UInt32(bufferside)))
        yCord = Int(arc4random_uniform(UInt32(inputy))+(UInt32(buffertop)))
        
        if(enemyCount < 10)
        {
            let enemy: UIView = UIView(frame: CGRect(x: 0, y:0, width:50, height:50))
            enemy.backgroundColor = UIColor.red
            enemy.center = CGPoint(x: xCord, y: yCord)
            if(TotalTime != 0){
                self.view.addSubview(enemy)
                views.insert(enemy, at: Int(enemyCount))
                enemyCount = enemyCount + 1
            }
        }
    }
    func spawnGood(){
        
        
        var bufferside : CGFloat
        var inputx : CGFloat
        var inputy : UInt32
        var buffertop : UInt32
        var xCord : Int
        var yCord : Int
        
        
        inputx = WIDTH*5/8
        bufferside = WIDTH / 8
        //inputy = UInt32(HEIGHT) * 5 / 8
        inputy = UInt32(HEIGHT) / 2
        //buffertop = UInt32(HEIGHT) / 8
        buffertop = UInt32(HEIGHT) / 4
        buffertop = UInt32(HEIGHT) / 8
        xCord = Int(arc4random_uniform(UInt32(inputx))+(UInt32(bufferside)))
        yCord = Int(arc4random_uniform(UInt32(inputy))+(UInt32(buffertop)))
        
        
        let good: UIImageView = UIImageView(frame: CGRect(x: 0, y:0, width:50, height:50))
        //good.backgroundColor = UIColor.blue
        good.center = CGPoint(x: xCord, y: yCord)
        
        //Beth look here 
        if(TotalTime != 0){
            good.image = #imageLiteral(resourceName: "nutrient")
            self.view.addSubview(good)
            views2.insert(good, at: Int(goodCount))
            goodCount = goodCount + 1
        }
        
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
            SPEED = WIDTH/200
            enemyCount = 0
            goodCount = 0
            //SpawnTimer = Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector (self.spawnEnemy), userInfo: nil, repeats: true)
            SpawnTimer2 = Timer.scheduledTimer(timeInterval: 1.25, target: self, selector: #selector (self.spawnGood), userInfo: nil, repeats: true)
            GameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.decreaseTotalTime), userInfo: nil, repeats: true)
            
            
        }
    
}

    
    
    
    
    
    

