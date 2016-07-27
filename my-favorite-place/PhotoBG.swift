//
//  PhotoBG.swift
//  my-favorite-place
//
//  Created by Mark Rassamni on 7/26/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit

class PhotoBG: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRectMake(0, 0, 600, 88))
        label.center = CGPointMake(UIScreen.mainScreen().bounds.size.width/2, 44)
        label.textAlignment = NSTextAlignment.Center
        label.text = "PHOTOS"
        label.backgroundColor = UIColor(colorLiteralRed: 246/255, green: 82/255, blue: 85/255, alpha: 1)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 19)
        label.textColor = UIColor.whiteColor()
        self.view.addSubview(label)
        
        let back = UIButton(frame: CGRectMake(0, 0, 54, 30))
        back.center = CGPointMake(47, 44)
        back.setTitle("< Back", forState: .Normal)
        back.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        back.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        back.addTarget(self, action: #selector(backPressed(_:)), forControlEvents: .TouchUpInside)
        back.addTarget(self, action: #selector (holdBack(_:)), forControlEvents: .TouchDown)
        
        //back.showsTouchWhenHighlighted = true
       // back.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        //back.alpha = .5
//        while back.state == UIControlState.Highlighted {
//            back.alpha = 0.5
//        }
//        while back.state == .Normal {
//            back.alpha = 1.0
//        }
               self.view.addSubview(back)
    }
    
    func holdBack (sender: UIButton){
        while sender.state == .Disabled{
            sender.alpha = 0.5
        }
    }
    
    func backPressed (sender: UIButton){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
