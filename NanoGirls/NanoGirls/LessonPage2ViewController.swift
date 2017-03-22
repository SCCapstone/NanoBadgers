//
//  LeesonPage2ViewController.swift
//  NanoGirls
//
//  Created by Spencer Nelson on 3/21/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//

import UIKit

class LessonPage2ViewController: UIViewController {

    @IBOutlet weak var lessonText2: UILabel!
    //creates instance of Colors class
    let colors = Colors()

    override func viewDidLoad() {
        super.viewDidLoad()

        refresh()
        
        lessonText2.text = "Great job collecting those nutrients! However, when materials such as hand soaps and lotions run off into the ocean, silver (Ag) nanoparticles are introduced to the coastal zone. Silver is dangerous to a lot of organisms there, including dinoflagellates! Keep collecting those nutrients while dodging the soaps!"
        
        /*"Hey Spencer! When hand soaps and lotions get into the drain and run off into the ocean, silver (Ag) nanoparticles are introduced to the coastal zone. Silver is dangerous to a lot of organisms there, including dinoflagellates! Dinoflagellates are phytoplankton that have the ability to propel themselves in any direction - and they need nutrients like nitrogen (N), phosphorous (P), and iron (Fe) to stay healthy! \nHelp the dinoflagellates consume nutrients by moving them around the screen. Remember to avoid silver, or the dinoflagellates will become sluggish and slow!"*/
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func refresh()
    {
        //sets the background gradient
        view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer.frame = view.frame
        view.layer.insertSublayer(backgroundLayer, at: 0)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
