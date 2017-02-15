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
    
    var SPEED : CGFloat!
    var HEIGHT : CGFloat!
    var WIDTH : CGFloat!
    var enemyCount : CGFloat!
    
    var clock : Timer!
    
    var timer : Timer!
    var SpawnTimer : Timer!
    var views = [UIView]()
    
    //DOWN BUTTON
    @IBAction func subtractYStop(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func subtractY(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(MiniGame2ViewController.subtractYHelperDown), userInfo: nil, repeats: true)
    }
    @IBAction func stopMovingUp(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func stopMovingUp2(_ sender: Any) {
        timer.invalidate()
    }
    func subtractYHelperDown()
    {
        player.center = CGPoint(x:player.center.x, y:player.center.y + 7)
    }
    
    
    //LEFT BUTTON
    
    @IBAction func subtractXStop(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func subtractX(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(MiniGame2ViewController.subtractXHelperDown), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopMovingLeft(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func stopMovingLeft2(_ sender: Any) {
        timer.invalidate()
    }
    func subtractXHelperDown()
    {
        player.center = CGPoint(x:player.center.x - 7, y:player.center.y)
        
    }
    
    //right button
    @IBAction func addXStop(_ sender: Any) {
        timer.invalidate()
    }
    func addXHelperDown()
    {
        player.center = CGPoint(x:player.center.x + 7, y:player.center.y)
        
    }
    @IBAction func addX(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(MiniGame2ViewController.addXHelperDown), userInfo: nil, repeats: true)
    }
    @IBAction func stopMovingRight(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func stopMovingRight2(_ sender: Any) {
        timer.invalidate()
    }
    //UP BUTTON
    @IBAction func addY(_ sender: Any) {

        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(MiniGame2ViewController.addYHelperUp), userInfo: nil, repeats: true)
    }
    func addYHelperUp()
    {
        player.center = CGPoint(x:player.center.x, y:player.center.y - 7)

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
    func addToY()
    {
            ySpeed = 10
    }
    
    
    func CPU(){
        player.center = CGPoint(x:player.center.x + xSpeed, y:player.center.y + ySpeed)
        for i in 0..<views.count
        {
            if(player.frame.intersects(views[i].frame))
            {
                views[i].removeFromSuperview()
            }
        }
    }
    
    func randomColor() -> UIColor{
        
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
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
        inputy = UInt32(HEIGHT) * 3 / 4
        buffertop = UInt32(HEIGHT) / 8
        xCord = Int(arc4random_uniform(UInt32(inputx))+(UInt32(bufferside)))
        yCord = Int(arc4random_uniform(UInt32(inputy))+(UInt32(buffertop)))
        
        if(enemyCount <= 10)
        {
        let enemy: UIView = UIView(frame: CGRect(x: 0, y:0, width:50, height:50))
        enemy.backgroundColor = randomColor()
        enemy.center = CGPoint(x: xCord, y: yCord)
            
        self.view.addSubview(enemy)
        views.insert(enemy, at: Int(enemyCount))
        enemyCount = enemyCount + 1
        
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
            SPEED = 10
            enemyCount = 0
            SpawnTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (self.spawnEnemy), userInfo: nil, repeats: true)
            
        }
    
}

    
    
    
    
    
    

