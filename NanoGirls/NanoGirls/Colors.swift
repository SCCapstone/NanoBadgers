//
//  Colors.swift
//  NanoGirls
//
//  Created by Elizabeth Pruett on 10/17/16.
//  Copyright © 2016 NanoBadgers. All rights reserved.
//
//  Edited by John Chandler on 15 Nov 2016.

import Foundation
import UIKit

class Colors {
    
    
    //Creates the blue - purple gradient from the design. 
    //let colorTop = UIColor(red: 191.0/255.0, green: 199.0/255.0, blue: 199.0/255.0, alpha: 1.0).cgColor
    //let colorBottom = UIColor(red: 191.0/255.0, green: 199.0/255.0, blue: 199.0/255.0, alpha: 1.0).cgColor
    
    let colorRed = UIColor(red: 255.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
    let colorBlue = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
    let colorYellow = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
    let colorGold = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
    let colorSilver = UIColor(red: 224.0/255.0, green: 224.0/255.0, blue: 224.0/255.0, alpha: 1.0).cgColor
    let colorDarkSilver = UIColor(red: 160.0/255.0, green: 160.0/255.0, blue: 160.0/255.0, alpha: 1.0).cgColor
    let colorWhite = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
    let colorBlack = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
    
    let gl: CAGradientLayer
    
    init() {
        gl = CAGradientLayer()
        gl.colors = [colorSilver, colorDarkSilver]
        gl.locations = [ 0.0, 1.0]
    }
}
