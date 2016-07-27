//
//  PhotosPageVC.swift
//  my-favorite-place
//
//  Created by Mark Rassamni on 7/24/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit

import UIKit

class PhotosPageVC: UIPageViewController {
    
    weak var photoDelegate: PhotosPageVCDelegate?
    
    var firstCall = true
    
    var photoPages = ["photo0", "photo1", "photo2", "photo3"]
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        //Add more pages here
        return [self.nextVC("noPhoto"), self.nextVC("photo0"), self.nextVC("photo1"), self.nextVC("photo2"), self.nextVC("photo3"), self.nextVC("photo4"), self.nextVC("photo5"), self.nextVC("photo6")]
        
    }()
    
    private func nextVC(page: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewControllerWithIdentifier("\(page)")
        // PASS BUTTON PRESSED TO HERE
    }
    
    func firstVC (photoTag: Int) -> UIViewController {
        firstCall = false
        return self.nextVC("photo\(photoTag)")
       // setViewControllers(<#T##viewControllers: [UIViewController]?##[UIViewController]?#>, direction: .Forward, animated: true, completion: nil)
       // return UIStoryboard(name: "Main", bundle: nil) .instantiateViewControllerWithIdentifier("photo\(photoTag)")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        if !firstCall {
            if let firstVC = orderedViewControllers.first {
                setViewControllers([firstVC], direction: .Forward, animated: true, completion: nil)
            }
            
            photoDelegate?.photosPageVC(self, didUpdatePageCount: orderedViewControllers.count)
        }
        }
      
}

extension PhotosPageVC: UIPageViewControllerDataSource {
    
    
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    //    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
    //        return orderedViewControllers.count
    //    }
    //
    //    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
    //        guard let firstViewController = viewControllers?.first,
    //            firstViewControllerIndex = orderedViewControllers.indexOf(firstViewController) else {
    //                return 0
    //        }
    //
    //        return firstViewControllerIndex
    //    }
    
    
}

extension PhotosPageVC: UIPageViewControllerDelegate {
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController],transitionCompleted completed: Bool) {
        if let firstViewController = viewControllers?.first, let index = orderedViewControllers.indexOf(firstViewController) {
            photoDelegate?.photosPageVC(self, didUpdatePageIndex: index)
        }
    }
    
}

protocol PhotosPageVCDelegate: class {
    
    func photosPageVC(photosPageVC: PhotosPageVC, didUpdatePageCount count: Int)
    
    func photosPageVC(photosPageVC: PhotosPageVC, didUpdatePageIndex index: Int)
    
}