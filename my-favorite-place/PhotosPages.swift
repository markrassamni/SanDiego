//
//  PhotosPageVC.swift
//  my-favorite-place
//
//  Created by Mark Rassamni on 7/24/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit

class PhotosPages: UIViewController {
    
    //var tag: Int!
    
    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var dots: UIPageControl!
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?, btnTag: Int) {
        self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        //tag = btnTag
        imagePressed(btnTag)
    }
    

    func imagePressed (photoTag: Int) {
        print("photo\(photoTag)")
        PhotosPageVC().firstVC(photoTag)
    
        //       let nextVC = self.storyboard?.instantiateViewControllerWithIdentifier("photo\(photoTag)") as? PhotosPageVC
//            self.navigationController?.pushViewController(nextVC!, animated: true)
        
        //vvv current testing
//    
//        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc : UIViewController = storyboard.instantiateViewControllerWithIdentifier("photo\(photoTag)") as UIViewController
//        
//        //vc.teststring = "hello"     
//        
//        let navigationController = UINavigationController(rootViewController: vc) // unneeded?
//
//        self.presentViewController(navigationController, animated: true, completion: nil) // CRASH
       
        
    }
    
//    convenience init(btnTag: UIViewController){
//        self.init(btnTag: btnTag)
//        self.navigationController?.pushViewController(btnTag, animated: true)
//    }
    
    @IBAction func backPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
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