//
//  PhotosVC.swift
//  my-favorite-place
//
//  Created by Mark Rassamni on 7/24/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit


class PhotosVC: UIViewController {
    
    
    
    @IBAction func onBackPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func thumbnailPressed(btn: UIButton) {
        
        btn.hidden = true
    }
    
    

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    
}