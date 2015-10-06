//
//  ViewController.swift
//  PageViewControllerDemo
//
//  Created by 川村祐人 on 2015/10/06.
//  Copyright © 2015年 ever sense, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var page: UIPageViewController!
    var pages: [UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pages = [
            (storyboard?.instantiateViewControllerWithIdentifier("Red"))!,
            (storyboard?.instantiateViewControllerWithIdentifier("Blue"))!,
            (storyboard?.instantiateViewControllerWithIdentifier("Yellow"))!,
        ]
        
        page = storyboard?.instantiateViewControllerWithIdentifier("Page") as! UIPageViewController
        page.dataSource = self
        page.delegate = self
        page.setViewControllers([pages.first!], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        addChildViewController(page)
        view.addSubview(page.view)
        page.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let index = pages.indexOf(viewController)!
        
        if index + 1 < pages.count {
            return pages[index + 1]
        } else {
            return pages.first
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let index = pages.indexOf(viewController)!
        
        if index - 1 > -1 {
            return pages[index - 1]
        } else {
            return pages.last
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

