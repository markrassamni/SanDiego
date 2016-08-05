//
//  ThingToDoVC.swift
//  San Diego
//
//  Created by Mark Rassamni on 8/4/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit

class ThingToDoVC: UIViewController {

    var thing: Int!
    
    var thingDescription = [String]()
    
    @IBOutlet weak var thingImg: UIImageView!
    
    @IBOutlet weak var thingLabel: UILabel!
    
    @IBAction func goBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDescriptions()
    }
    
    func loadDescriptions(){
        thingDescription += ["D0", "D1", "D2"]
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
       thingImg.image = UIImage(named: "photo\(thing)")
        thingLabel.text = thingDescription[thing]
        if thing == 2{
            thingImg.image = UIImage(named: "princess")
        }
    }
 
    



}
