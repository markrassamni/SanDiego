//
//  PlaceToGoVC.swift
//  San Diego
//
//  Created by Mark Rassamni on 8/9/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit

class PlaceToGoVC: UIViewController {

    //var toDo: Int?
    var place: ToDo!
    
    var desc = [String]()
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var mainLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImg.clipsToBounds = true
   
    }

//    func loadDescriptions(){
//        thingDescription += ["D0", "D1", "D2"]
//    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        mainImg.image = place.img //UIImage(named: "photo\(place)")
        //name images thingX
        mainLbl.text = place.description
    }
    
    
    @IBAction func goBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
