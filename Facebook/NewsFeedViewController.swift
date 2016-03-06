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
        NewsFeedScrollView.contentSize = homeFeedImageView.image!.size
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
        print("0 indexed : \(photoArray[0])")
        print(photoArray.indexOf(selectedImageView))
        lightboxTransition.selectedImageCenter = selectedImageView.center
        
        photoViewController.weddingImages = photoArray
        
    }
    
}
