//
//  OriginStoryViewController.swift
//  NanoGirls
//
//  Created by Elizabeth Pruett on 2/28/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//

import UIKit

class OriginStoryViewController: UIViewController {
    @IBOutlet weak var myView: UIView!

    @IBOutlet weak var originLabel: UILabel!
    let colors = Colors()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        refresh()
        
        originLabel.text = "There were once two scientists who studied nano-particles. One day, chemicals from a large industrial company spilled into a nearby body of water. The two research scientists decided to test a prototype nano-particle they had been working on to help clean the toxins in the water. After sampling the water, the scientists added the nano-particles, Au and Ag, hoping to test the reaction – but, one of the scientists leaned in too far and fell! Trying to help her friend, the other scientist slips and falls in as well. Hours later the girls emerged, tired and confused, and went home. \n \nBack at the lab, one of the scientists, still jittery from the incident, is frightened by a noise in the hallway – and suddenly shrinks down to nano-size! Moments later, she returns to normal, shocked and amazed at what just happened. She explains to her friend that she felt normal, but her skin had a metallic sheen and her vision was intensified. After running some tests, the scientists realized they had new powers, and that was how they survived in the toxic water! \n\nThey realize their powers came from the nano-particles they developed; now, they were no longer just scientists, but superheroes Nano Gold and Nano Silver! \n\nWill you help the Nano Girls as they work to use their powers for good? "

        
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
