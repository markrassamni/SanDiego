//
//  TableVC.swift
//  San Diego
//
//  Created by Mark Rassamni on 8/1/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit

class TableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var toDo = [ToDo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        initToDo()
        if UIDevice.currentDevice().model == "iPad" {
            tableView.rowHeight = 250
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
      
        if let indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
    func initToDo(){
        toDo = []
        //rename img to thingX
        let activity0 = ToDo(img: UIImage(named: "zoo")!, description: "Come support Harambe's family", name: "San Diego Zoo")
        let activity1 = ToDo(img: UIImage(named: "chargers")!, description: "Support the team before they are forced to move", name: "Chargers Game")
        
        let activity2 = ToDo(img: UIImage(named: "aerospace")!, description: "They have flying things here", name: "Aerospace Museum")
        
        let activity3 = ToDo(img: UIImage(named: "belmontPark2")!, description: "There's a roller coaster with no loops", name: "Belmont Park")
       
        

        toDo.append(activity0)
        toDo.append(activity1)
        toDo.append(activity2)
        toDo.append(activity3)
        
//        tableView.reloadData() // ADD IN SAN DIEGO APP???
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell") as? tableCells {
            let pic = toDo[indexPath.row].img
            //let pic = UIImage(named: "photo1.jpg")
            let text = toDo[indexPath.row].name
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
        return toDo.count
    }
    

    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        let cellIndex = toDo[indexPath.row]
        performSegueWithIdentifier("PlaceToGo", sender: cellIndex)
        
        return indexPath
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PlaceToGo" {
            if let thingToDo = segue.destinationViewController as? PlaceToGoVC{
                if let place = sender as? ToDo {
                    thingToDo.place = place
                }
            }
        }
    }

}
