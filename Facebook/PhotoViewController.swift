//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Jenn Leung on 3/3/16.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    var weddingImageIndex: Int!
    var weddingImages: [UIImageView]!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var photoActions: UIImageView!
    @IBOutlet var doneButton: UIImageView!
    @IBOutlet var overallView: UIView!
    var selectedImageCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        
        let imageWidth: CGFloat = 320
        let frameHeight: CGFloat = 444
        var xPosition: CGFloat = 0
        var scrollViewContentSize: CGFloat = 0
        
        //To create the UIImageViews that goes into scrollview.
        
        for var index = 0; index < weddingImages.count; index++ {
            
            let myImageViewOld: UIImageView = weddingImages[index]
            let myImage : UIImage = myImageViewOld.image!
            
            let myImageView: UIImageView = UIImageView()
            myImageView.image = myImage
            myImageView.contentMode = .ScaleAspectFit
            
            myImageView.frame.size.width = imageWidth
            myImageView.frame.size.height = myImage.size.height
            myImageView.frame.origin.x = xPosition
            myImageView.frame.origin.y = 0
            
            myImageView.frame.offsetInPlace(dx: 0, dy: (frameHeight - myImage.size.height - 20) / 2)
            scrollView.addSubview(myImageView)
            
            xPosition += imageWidth
            scrollViewContentSize += imageWidth
            
        }
        scrollView.contentSize = CGSize(width: scrollViewContentSize, height: frameHeight)
        let offset = CGPoint(x: CGFloat(weddingImageIndex) * imageWidth, y: 0)
        scrollView.setContentOffset(offset, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let alphaPositive = convertValue(scrollView.contentOffset.y, r1Min: 0, r1Max: 250, r2Min: 1, r2Max: 0)
        let alphaNegative = convertValue(scrollView.contentOffset.y, r1Min: 0, r1Max: -250, r2Min: 1, r2Max: 0)
        
        //Change alpha of bg based on scrolling
        if scrollView.contentOffset.y > 0 {
            scrollView.backgroundColor = UIColor(white: 0, alpha: alphaPositive)
        } else if scrollView.contentOffset.y < 0 {
            scrollView.backgroundColor = UIColor(white: 0, alpha: alphaNegative)
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
            if scrollView.contentOffset.y >= 75 {
                dismissViewControllerAnimated(true, completion: nil)
            } else if scrollView.contentOffset.y <= -75 {
                dismissViewControllerAnimated(true, completion: nil)
            } else if scrollView.contentOffset.y > 0 && scrollView.contentOffset.y < 75 {
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.scrollView.contentOffset.y = 0
                    self.scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
                    self.doneButton.alpha = 1
                    self.photoActions.alpha = 1
                })
            } else if scrollView.contentOffset.y < 0 && scrollView.contentOffset.y > -75 {
                
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.doneButton.alpha = 1
                    self.photoActions.alpha = 1
                })
            }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return imageView
    }
    
    
}
