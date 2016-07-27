//
//  masterVC.swift
//  my-favorite-place
//
//  Created by Mark Rassamni on 7/25/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit

class masterVC: UIViewController {

    private var _page = -1
    
    var page: Int {
        get{
            return _page
        }
    }
    
    func setPage (tag: Int){
        _page = tag
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
