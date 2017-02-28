//
//  OriginStoryViewController.swift
//  NanoGirls
//
//  Created by Elizabeth Pruett on 2/28/17.
//  Copyright © 2017 NanoBadgers. All rights reserved.
//

import UIKit

class OriginStoryViewController: UIViewController {

    @IBOutlet weak var narrationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        narrationLabel.text = "There is an industrial spill of chemicals by a large company into a neighboring body of water. The Girls, as developmental research scientists, are called to sample the spill for remediation and management purposes. The Girls decide to take a prototype NP that they have been working on to help clean the toxins spilled into the environment; thinking that these NPs will be the new breakthrough to cleaning up chemical accidents. The girls finish their initial sampling and decide to add the NPs (a mixture of Au and Ag) and then sample again to see the immediate response, but one of the girls gets too close while sampling and falls into the chemically contaminated water. The other girl leans over the ledge to help her friend but leans too far, slips, and falls into the water as well. Hours later the girls emerge from the sludge, exhausted and baffled as to how they survived a swim in the toxic sludge water."
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
