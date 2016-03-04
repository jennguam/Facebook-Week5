//
//  MessagesViewController.swift
//  Facebook
//
//  Created by Jenn Leung on 2/3/16.

import UIKit

class MessagesViewController: UIViewController {

    @IBOutlet weak var MessagesScrollView: UIScrollView!
    
    @IBOutlet weak var MessagesImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MessagesScrollView.contentSize = MessagesImageView.image!.size

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
