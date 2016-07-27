//
//  ViewController.swift
//  my-favorite-place
//
//  Created by Mark Rassamni on 7/23/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var aboutBtn: UIButton!
    @IBOutlet weak var photosBtn: UIButton!
    @IBOutlet weak var san: UILabel!
    @IBOutlet weak var diego: UILabel!
    @IBOutlet weak var california: UILabel!
    @IBOutlet weak var outdoor: UILabel!
    @IBOutlet weak var adventure: UILabel!
    @IBOutlet weak var beach: UILabel!
    @IBOutlet weak var compass: UIImageView!
    
    
    func stroke (lbl: UILabel, text: String, width: Float){
         lbl.attributedText = NSAttributedString(string: text, attributes: [NSStrokeColorAttributeName: UIColor.blackColor(), NSStrokeWidthAttributeName: width])
    }
    
    func compassStroke (compass: UIImage){
        
        let filter = CIFilter(name: "CIColorInvert")
        filter!.setValue(CIImage(image: compass), forKey: kCIInputImageKey)
        self.compass.image = UIImage(CIImage: (filter?.outputImage)!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutBtn.layer.cornerRadius = 5.0
        photosBtn.layer.cornerRadius = 5.0
        
        stroke(san, text: "SAN", width: -0.8)
        stroke(diego, text: "DIEGO", width: -0.8)
        stroke(california, text: "CALIFORNIA", width: -3.0)
        stroke(outdoor, text: "OUTDOOR", width: -2.0)
        stroke(adventure, text: "ADVENTURES", width: -2.0)
        stroke(beach, text: "BEACH", width: -2.0)
        compassStroke(compass.image!)
        
    }


    
    
    
    
    

}

