//
//  PhotosVC.swift
//  my-favorite-place
//
//  Created by Mark Rassamni on 7/24/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit


class PhotosVC: UIViewController {
    
    
    @IBOutlet var thumbnails: [UIButton]!
    
    @IBOutlet weak var home: UIButton!

    @IBOutlet weak var bigPhoto: UIImageView!
    
    var photoView: UIImageView?
    
    @IBOutlet var stackViews: [UIStackView]!
    
    
    @IBAction func onBackPressed(sender: UIButton) {
        if bigPhoto?.hidden == true {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            home.setTitle("< Back", forState: .Normal)
            showThumbnails()
            bigPhoto?.hidden = true
        }
    }

    
    
    @IBAction func thumbnailPressed(btn: UIButton) {
        hideThumbnails()
        //hideImg.hidden = false
        //home.hidden = true
        home.setTitle("X Close", forState: .Normal)
        //let imgPressed = btn.tag
        //let showImg = "img\(btn.tag)"
        bigPhoto.image = UIImage(named: "photo\(btn.tag)")
        //photoView = bigPhotos[(btn.tag)]
        bigPhoto!.hidden = false
        bigPhoto!.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
    }
    

    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        if UIDevice.currentDevice().model != "iPad"{
            if size.width > size.height {
                for stackView in stackViews {
                    stackView.axis = UILayoutConstraintAxis.Horizontal
                }
            } else{
                for stackView in stackViews {
                    stackView.axis = UILayoutConstraintAxis.Vertical
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for thumbnail in self.thumbnails {
            thumbnail.imageView?.contentMode = UIViewContentMode.ScaleAspectFill
        }
        
        //var shownPhoto = UIImage(named: "")
    }
    
    func hideThumbnails(){
        for thumbnails in self.thumbnails {
            thumbnails.alpha = 0.3
            thumbnails.userInteractionEnabled = false
        }
    }
    
    func showThumbnails(){
        for thumbnails in self.thumbnails {
            thumbnails.alpha = 1.0
            thumbnails.userInteractionEnabled = true
        }
    }
    
    
    
    
    
}