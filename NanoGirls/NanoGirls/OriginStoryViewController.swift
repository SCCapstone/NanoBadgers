//
//  OriginStoryViewController.swift
//  NanoGirls
//
//  Created by Elizabeth Pruett on 2/28/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//

import UIKit

class OriginStoryViewController: UIViewController {
    
    var timesClicked:Int!
    
    @IBOutlet weak var myView: UIView!

    @IBOutlet weak var ngImageView: UIImageView!
    @IBOutlet weak var originLabel: UILabel!
    let colors = Colors()
    
    @IBAction func nextButton(_ sender: Any) {
        timesClicked = timesClicked + 1
        if (timesClicked == 1)
        {
            originLabel.text = "You’re right! Well, we started off as two normal scientists studying nano-particles. One day, chemicals from a large industrial company spilled into a nearby body of water."
            ngImageView.image = UIImage(named: "PROF2")
        }
        if (timesClicked == 2)
        {
            originLabel.text = "This was a good opportunity to test our prototype nano-particles, Gold and Silver, to clean toxins from water. But when Gold tried to add the particles…"
            ngImageView.image = UIImage(named: "PROF1")
        }
        if (timesClicked == 3)
        {
            originLabel.text = "I fell in! Trying to help me out, Silver fell in as well. We’re not sure what happened next…but hours later we managed to get ourselves out of the water and go home."
            ngImageView.image = UIImage(named: "PROF2")
        }
        if (timesClicked == 4)
        {
            originLabel.text = "Back at the lab, I heard a noise, and somehow in my fright- disappeared! Only I didn’t actually disappear; I shrunk down to nano-size. Moments later, I returned to normal, but found my skin had a metallic sheen and my vision was much better."
            ngImageView.image = UIImage(named: "PROF1")
        }
        if (timesClicked == 5)
        {
            originLabel.text = "We ran some tests, and discovered I had these changes too. We realized we had new powers from the nano-particles, and that was how we survived the toxic water!"
            ngImageView.image = UIImage(named: "PROF2")
        }
        if (timesClicked == 6)
        {
            originLabel.text = "Now, we are scientists and superheroes Nano Silver and Nano Gold by night! Will you help us as we try to use our new powers for good? "
            ngImageView.image = UIImage(named: "PROF1")
        }
        if (timesClicked == 7)
        {
            performSegue(withIdentifier: "beginGame", sender: self)
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        refresh()
        
        timesClicked = 0
        
        originLabel.text = "Hey Gold, we should tell the gamer about how we became the Nano Girls! "

        
    }
    
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    func refresh()
    {
        //sets the background gradient
        myView.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)
    }




}
