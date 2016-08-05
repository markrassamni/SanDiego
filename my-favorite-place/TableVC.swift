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
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
      
        if let indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRowAtIndexPath(indexPath, animated: animated)
        }
    }
    
    func initToDo(){
        toDo = []
        let activity0 = ToDo(img: UIImage(named: "photo0")!, description: "Thing 1")
        let activity1 = ToDo(img: UIImage(named: "photo1")!, description: "Thing 2")
        
        let activity2 = ToDo(img: UIImage(named: "princess")!, description: "I need help thinking of things to do princess")
       
        

        toDo.append(activity0)
        toDo.append(activity1)
        toDo.append(activity2)
        

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell") as? tableCells {
            let pic = toDo[indexPath.row].img
            //let pic = UIImage(named: "photo1.jpg")
            let text = toDo[indexPath.row].description
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
        
        let cellIndex = indexPath.row
        performSegueWithIdentifier("ThingToDo", sender: cellIndex)
        
        return indexPath
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let thingToDo = segue.destinationViewController as? ThingToDoVC{
            if let index = sender as? Int {
                thingToDo.thing = index
            }
        }
    }

}