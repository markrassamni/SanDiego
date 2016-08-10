//
//  PhotosVC.swift
//  my-favorite-place
//
//  Created by Mark Rassamni on 7/24/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit
import AVFoundation


class PhotosVC: UIViewController {
    
    
    @IBOutlet var thumbnails: [UIButton]!
    
    @IBOutlet weak var home: UIButton!

    @IBOutlet weak var bigPhoto: UIImageView!
    
    var photoView: UIImageView?
    
    @IBOutlet var stackViews: [UIStackView]!
    
    @IBOutlet weak var bgBtn: UIButton!
    
    @IBOutlet weak var blockingView: UIImageView!
    
    var gesture = UITapGestureRecognizer()
    
    
    @IBAction func onBackPressed(sender: UIButton) {
        if bigPhoto?.hidden == true {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            home.setTitle("< Back", forState: .Normal)
            showThumbnails()
            bigPhoto?.hidden = true
           // bgBtn.hidden = true
            //blockingView.hidden = true
        }
    }

    @IBAction func bgBtnPressed(sender: UIButton) {
        onBackPressed(sender)
    }
    
    
    @IBAction func thumbnailPressed(btn: UIButton) {
        hideThumbnails()
        home.setTitle("X Close", forState: .Normal)
        bigPhoto.image = UIImage(named: "photo\(btn.tag)")
        bigPhoto!.hidden = false
        bigPhoto!.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
       // bgBtn.hidden = false
        
        
        
//        
//        var newheight: CGFloat
//        var newwidth: CGFloat
//        
//        if (bigPhoto.image!.size.height>=bigPhoto.image!.size.width){
//            newheight = bigPhoto.frame.size.height
//            newwidth = (bigPhoto.image!.size.width/bigPhoto.image!.size.height)*newheight
//            
//            if(newwidth > bigPhoto.frame.size.width){
//                let diff = bigPhoto.frame.size.width-newwidth;
//                newheight = newheight+diff/newheight*newheight;
//                newwidth=bigPhoto.frame.size.width;
//            }
//            
//        }
//        else{
//            newwidth=bigPhoto.frame.size.width;
//            newheight=(bigPhoto.image!.size.height/bigPhoto.image!.size.width)*newwidth;
//            
//            if(newheight>bigPhoto.frame.size.height){
//                let diff=bigPhoto.frame.size.height-newheight;
//                newwidth=newwidth+diff/newwidth*newwidth;
//                newheight=bigPhoto.frame.size.height;
//            }
//        }
//
//        blockingView.frame=CGRectMake(bigPhoto.frame.origin.x+(bigPhoto.frame.size.width-newwidth)/2,bigPhoto.frame.origin.y+(bigPhoto.frame.size.height-newheight)/2,newwidth,newheight)
        
        //blockingView.image = UIImage(named: "photo\(btn.tag)")
       // blockingView.contentMode = UIViewContentMode.ScaleAspectFit
        
       // var frame = bigPhoto.frame
        //frame.size = (bigPhoto.image?.size)!

        
        //
//        let ivSize = bigPhoto.frame.size
//        var imgSize = bigPhoto.image?.size
//        
//        let scaleW = ivSize.width / (imgSize?.width)!
//        let scaleH = ivSize.height / (imgSize?.height)!
//        let aspect = fmin(scaleW, scaleH)
//        
//        imgSize?.width *= aspect
//        imgSize?.height *= aspect
//        var imgRect = CGRect(x: 0, y: 0, width: imgSize!.width, height: imgSize!.height)
//        imgRect.origin.x = (ivSize.width-imgRect.size.width)/2
//        imgRect.origin.y = (ivSize.height-imgRect.size.height)/2
//        imgRect.origin.x += bigPhoto.frame.origin.x
//        imgRect.origin.y += bigPhoto.frame.origin.y
//        
//        blockingView.contentMode = UIViewContentMode.ScaleAspectFit
//        blockingView.frame = imgRect
        
        
        
    
        
   
        
       // blockingView.frame = CGSizeMake(newwidth, newheight)
       // blockingView.hidden = false

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
        gesture = UITapGestureRecognizer(target: bigPhoto, action: #selector(PhotosVC.gestureActivated))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
    }
    
    func gestureActivated(){
        print("Works")
        let tap = gesture.locationInView(bigPhoto)
        if let image = bigPhoto.image?.accessibilityFrame {
            if !image.contains(tap) {
                bigPhoto.hidden = true
            }
        }
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