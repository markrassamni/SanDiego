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
    
    @IBOutlet weak var aboutLbl: UILabel!
    
    @IBOutlet weak var backBtn: UIButton!
    
    
    @IBAction func onBackPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backBtn.layer.cornerRadius = 5.0
        
        aboutLbl.attributedText = NSAttributedString(string: "ABOUT SAN DIEGO", attributes: [NSStrokeColorAttributeName: UIColor.blackColor(), NSStrokeWidthAttributeName: -3.5])
        
      //  backBtn.titleLabel?.attributedText = NSAttributedString(string: "< Back", attributes: [NSStrokeColorAttributeName: UIColor.blackColor(), NSStrokeWidthAttributeName: -2.5])
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
    
