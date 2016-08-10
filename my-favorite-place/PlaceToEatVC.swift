//
//  PlaceToEatVC.swift
//  San Diego
//
//  Created by Mark Rassamni on 8/5/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit

class PlaceToEatVC: UIViewController {

    var place: Int!
    
    var placeDescription = [String]()
    
    
    @IBOutlet weak var placeImg: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    
    @IBAction func goBack(sender: AnyObject){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDescriptions()
    }
    
    func loadDescriptions() {
        placeDescription += ["D0", "D1", "D2"]
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        placeImg.image = UIImage(named: "photo\(place)")
        //name images placeX
        placeLabel.text = placeDescription[place]
    }
}
