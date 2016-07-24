//
//  AboutPageVC.swift
//  my-favorite-place
//
//  Created by Mark Rassamni on 7/24/16.
//  Copyright © 2016 markrassamni. All rights reserved.
//

import UIKit

class AboutPageVC: UIPageViewController {

    weak var newDelegate: AboutPageVCDelegate?
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        //Add more pages here 
        return [self.nextVC("FirstPage"), self.nextVC("SecondPage"), self.nextVC("ThirdPage")]
    }()
    
    private func nextVC(page: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewControllerWithIdentifier("\(page)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self
        
        if let firstVC = orderedViewControllers.first {
            setViewControllers([firstVC], direction: .Forward, animated: true, completion: nil)
        }
        
        newDelegate?.aboutPageVC(self, didUpdatePageCount: orderedViewControllers.count)
        

    }

    

}

extension AboutPageVC: UIPageViewControllerDataSource {
    
    
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

extension AboutPageVC: UIPageViewControllerDelegate {
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController],transitionCompleted completed: Bool) {
        if let firstViewController = viewControllers?.first, let index = orderedViewControllers.indexOf(firstViewController) {
            newDelegate?.aboutPageVC(self, didUpdatePageIndex: index)
        }
    }
    
}

protocol AboutPageVCDelegate: class {
    
    func aboutPageVC(aboutPageVC: AboutPageVC, didUpdatePageCount count: Int)

    func aboutPageVC(aboutPageVC: AboutPageVC, didUpdatePageIndex index: Int)
    
}

