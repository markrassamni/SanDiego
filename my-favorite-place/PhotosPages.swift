//
//  PhotosPageVC.swift
//  my-favorite-place
//
//  Created by Mark Rassamni on 7/24/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit

class PhotosPages: UIViewController {
    
    
    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var dots: UIPageControl!
    
//    @IBAction func onBackPressed(sender: AnyObject) {
//        dismissViewControllerAnimated(true, completion: nil)
//    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let photosPageVC = segue.destinationViewController as? PhotosPageVC {
            photosPageVC.photoDelegate = self
        }
    }
    
}

extension PhotosPages: PhotosPageVCDelegate {
    func photosPageVC(photosPageVC: PhotosPageVC, didUpdatePageCount count: Int) {
        dots.numberOfPages = count
    }
    
    func photosPageVC(photosPageVC: PhotosPageVC, didUpdatePageIndex index: Int) {
        dots.currentPage = index
    }
}