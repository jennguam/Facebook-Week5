//
//  NewsFeedViewController.swift
//  Facebook
//  Created by Jenn Leung on 2/3/16.

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet weak var NewsFeedScrollView: UIScrollView!
    
    @IBOutlet weak var NewsFeedImageView: UIImageView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var selectedImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NewsFeedScrollView.contentSize = NewsFeedImageView.image!.size

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        activityIndicator.startAnimating()
        
        //NewsFeedImageView.hidden = true
        
    }
    
    @IBAction func onTap(sender: UITapGestureRecognizer) {
        selectedImageView = sender.view as! UIImageView
        performSegueWithIdentifier("photoSegue", sender: self)
    }
    override func viewDidAppear(animated: Bool) {
        
        delay(0, closure: { () -> () in
            
            self.activityIndicator.stopAnimating()
            
//            self.NewsFeedImageView.fadeIn()
            //self.NewsFeedImageView.hidden = false

            
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let photoViewController = segue.destinationViewController as! PhotoViewController
        
        photoViewController.image = selectedImageView.image
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
