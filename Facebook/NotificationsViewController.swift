//
//  NotificationsViewController.swift
//  Facebook
//
//  Created by Jenn Leung on 2/3/16.


import UIKit

class NotificationsViewController: UIViewController {

    @IBOutlet weak var NotificationsScrollView: UIScrollView!
    
    @IBOutlet weak var NotificationsImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationsScrollView.contentSize = CGSize(width: 320, height: 818)
        
        NotificationsScrollView.contentSize = NotificationsImageView.image!.size
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
