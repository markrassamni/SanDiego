//
//  PageDots.swift
//  my-favorite-place
//
//  Created by Mark Rassamni on 7/24/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit

class PageDots: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var dotsView: UIPageControl!
    
    @IBAction func onBackPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let aboutPageVC = segue.destinationViewController as? AboutPageVC {
            aboutPageVC.newDelegate = self
        }
    }
    
}

extension PageDots: AboutPageVCDelegate {
    
    func aboutPageVC(aboutPageVC: AboutPageVC, didUpdatePageCount count: Int) {
        dotsView.numberOfPages = count
    }
    
    func aboutPageVC(aboutPageVC: AboutPageVC, didUpdatePageIndex index: Int) {
        dotsView.currentPage = index
    }
    
}
    
