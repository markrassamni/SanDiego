//
//  PlaceToGoVC.swift
//  San Diego
//
//  Created by Mark Rassamni on 8/9/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit

class PlaceToGoVC: UIViewController {

    var place: ToDo!
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var mainLbl: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImg.clipsToBounds = true
   
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        mainImg.image = place.img
        mainLbl.text = place.name
        desc.text = place.description
    }
    
    
    @IBAction func goBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
