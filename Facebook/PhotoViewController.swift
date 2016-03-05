//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Jenn Leung on 3/3/16.
//  Copyright © 2016 plainspace. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    var weddingImage: UIImage!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var photoActions: UIImageView!
    @IBOutlet var doneButton: UIImageView!
    @IBOutlet var overallView: UIView!
    var selectedImageCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        imageView.image = weddingImage
        
        scrollView.contentSize = CGSize(width: 320, height: 1000)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("start scrolling")
        if scrollView.contentOffset.y > 0 {
            overallView.backgroundColor = UIColor(white: 0, alpha: 1-(scrollView.contentOffset.y * 0.01))
        } else if scrollView.contentOffset.y < 0 {
            overallView.backgroundColor = UIColor(white: 0, alpha: 1-(scrollView.contentOffset.y * -0.01))
        }
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        UIView.animateWithDuration(0.2) { () -> Void in
            self.photoActions.alpha = 0
            self.doneButton.alpha = 0
        }
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            if scrollView.contentOffset.y >= 60 {
                dismissViewControllerAnimated(true, completion: nil)
            } else if scrollView.contentOffset.y <= -60 {
                dismissViewControllerAnimated(true, completion: nil)
            } else if scrollView.contentOffset.y > 0 && scrollView.contentOffset.y < 60 {
                print("should animate back")
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.scrollView.contentOffset.y = 0
                    self.scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
                    self.doneButton.alpha = 1
                    self.photoActions.alpha = 1
                })
            } else if scrollView.contentOffset.y < 0 && scrollView.contentOffset.y > -60 {
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.doneButton.alpha = 1
                    self.photoActions.alpha = 1
                })
            }
    }
    
    
    
}
