//
//  WelcomeViewController.swift
//  CarouselPrototype
//
//  Created by Nan Chen on 5/17/15.
//  Copyright (c) 2015 Nan Chen. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var spinImageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
        
        self.spinImageView.alpha = 0
        self.backSwitch.alpha = 0
        self.spinButton.alpha = 0

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        self.pageControl.alpha = 1
        
        if pageControl.currentPage == 3 {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                self.spinImageView.alpha = 1
                self.backSwitch.alpha = 1
                self.spinButton.alpha = 1
                self.pageControl.alpha = 0
            }, completion: nil)

        } else {
            self.spinImageView.alpha = 0
            self.backSwitch.alpha = 0
            self.spinButton.alpha = 0
            self.pageControl.alpha = 1

        }
        


    }

}
