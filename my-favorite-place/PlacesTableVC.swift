//
//  PlacesTableVC.swift
//  San Diego
//
//  Created by Mark Rassamni on 8/5/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit

class PlacesTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var placesTable: UITableView!
    
    var places = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesTable.delegate = self
        placesTable.dataSource = self
        
        if UIDevice.currentDevice().model == "iPad" {
            placesTable.rowHeight = 250
        }
        
        initToDo()
    }
    
    func initToDo(){
        places = []
        //rename img to placeX
        let activity0 = ToDo(img: UIImage(named: "outback")!, description: "The best steak around town", name: "Outback Steakhouse")
        let activity1 = ToDo(img: UIImage(named: "phils")!, description: "Ask Phil to BBQ his special for you", name: "Phil's BBQ")
        
        let activity2 = ToDo(img: UIImage(named: "slaters")!, description: "Try their delicious burgers made with 50% beef and 50% bacon!", name: "Slater's 50/50")
        
        let activity3 = ToDo(img: UIImage(named: "phipsi")!, description: "The best food in San Diego", name: "Mark's Kitchen")
        
        let activity4 = ToDo(img: UIImage(named: "yummySushi")!, description: "A favorite among San Diego sushi lovers", name: "Yummy Sushi")
        
        
        
        places.append(activity0)
        places.append(activity1)
        places.append(activity2)
        places.append(activity3)
        places.append(activity4)
//        tableView.reloadData() // ADD IN SAN DIEGO APP???
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath: NSIndexPath = self.placesTable.indexPathForSelectedRow {
            self.placesTable.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell") as? tableCells {
            let pic = places[indexPath.row].img
            //let pic = UIImage(named: "photo1.jpg")
            let text = places[indexPath.row].name
            cell.configureCell(pic, text: text)
            return cell
        } else{
            return tableCells()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        let cellIndex = places[indexPath.row]
        performSegueWithIdentifier("PlaceToGo", sender: cellIndex)
        
        return indexPath
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PlaceToGo" {
            if let placeToEat = segue.destinationViewController as? PlaceToGoVC {
                if let place = sender as? ToDo {
                    placeToEat.place = place
                }
            }
        }
    }
}
