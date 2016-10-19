//
//  Colors.swift
//  NanoGirls
//
//  Created by Elizabeth Pruett on 10/17/16.
//  Copyright © 2016 NanoBadgers. All rights reserved.
//

import Foundation
import UIKit

class Colors {
    
    
    //Creates the blue - purple gradient from the design. 
    let colorTop = UIColor(red: 6.0/255.0, green: 49.0/255.0, blue: 250.0/255.0, alpha: 1.0).cgColor
    let colorBottom = UIColor(red: 67.0/255.0, green: 33.0/255.0, blue: 179.0/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
        gl = CAGradientLayer()
        gl.colors = [colorTop, colorBottom]
        gl.locations = [ 0.0, 1.0]
    }
}
