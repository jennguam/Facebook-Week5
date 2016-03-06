//
//  NewsFeedViewController.swift
//  Facebook
//  Created by Jenn Leung on 2/3/16.

import UIKit

class NewsFeedViewController: UIViewController {
    
    @IBOutlet var photoArray: [UIImageView]!
    
    @IBOutlet var homeFeedImageView: UIImageView!
    @IBOutlet weak var NewsFeedScrollView: UIScrollView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var isPresenting: Bool = true
    var selectedImageView: UIImageView!
    var fadeTransition: FadeTransition!
    var lightboxTransition: LightboxTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lightboxTransition = LightboxTransition()
        //lightboxTransition.heyQT = "what"
        NewsFeedScrollView.contentSize = homeFeedImageView.image!.size
        //print (photoArray)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    //    override func viewDidAppear(animated: Bool) {
    ////        delay(0, closure: { () -> () in
    ////            self.activityIndicator.stopAnimating()
    ////            // self.NewsFeedImageView.fadeIn()
    ////            //self.NewsFeedImageView.hidden = false
    ////
    ////        })
    //    }
    //
    //    override func viewWillAppear(animated: Bool) {
    //
    //        //activityIndicator.startAnimating()
    //
    //        //NewsFeedImageView.hidden = true
    //
    //    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        performSegueWithIdentifier("photoSegue", sender: self)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        let photoViewController = segue.destinationViewController as! PhotoViewController
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        photoViewController.transitioningDelegate = lightboxTransition

    
        photoViewController.weddingImageIndex = photoArray.indexOf(selectedImageView)
        //print(photoArray[selectedImageView.image.index+1])
        //trying to grab index of array and so i could show previous and next photos
        print("0 indexed : \(photoArray[0])")
        print(photoArray.indexOf(selectedImageView))
        lightboxTransition.selectedImageCenter = selectedImageView.center
        //print(selectedImageView.center)
        
        photoViewController.weddingImages = photoArray
        
    }
    
    
    
    
    
    //    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
    //        isPresenting = true
    //        return self
    //    }
    //
    //    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
    //        isPresenting = false
    //        return self
    //    }
    //    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
    //        // The value here should be the duration of the animations scheduled in the animationTransition method
    //        return 0.4
    //    }
    
    //    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    //        print("animating transition")
    //        let containerView = transitionContext.containerView()!
    //        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
    //        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
    //
    //        if (isPresenting) {
    //            containerView.addSubview(toViewController.view)
    //            toViewController.view.alpha = 0
    //            UIView.animateWithDuration(0.4, animations: { () -> Void in
    //                toViewController.view.alpha = 1
    //                }) { (finished: Bool) -> Void in
    //                    transitionContext.completeTransition(true)
    //            }
    //        } else {
    //            UIView.animateWithDuration(0.4, animations: { () -> Void in
    //                fromViewController.view.alpha = 0
    //                }) { (finished: Bool) -> Void in
    //                    transitionContext.completeTransition(true)
    //                    fromViewController.view.removeFromSuperview()
    //            }
    //        }
    //    }
    
    
    
    
}
