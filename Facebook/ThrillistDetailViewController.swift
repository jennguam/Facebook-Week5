//
//  ThrillistDetailViewController.swift
//  Facebook
//
//  Created by Jenn Leung on 2/3/16.

import UIKit

class ThrillistDetailViewController: UIViewController {
    
    @IBOutlet weak var ThrillistScrollView: UIScrollView!
    
    @IBOutlet weak var ThrillistImageView: UIImageView!
    
    @IBOutlet weak var BackButton: UIButton!
    
    @IBOutlet weak var CommentBarParentView: UIView!
    
    @IBAction func DidTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var TouchCommentField: UITextField!
    
    var initialY: CGFloat!
    var offset: CGFloat!
    
    func keyboardWillShow(notification: NSNotification!) {
        CommentBarParentView.frame.origin.y = initialY + offset
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        CommentBarParentView.frame.origin.y = initialY
    }
    
    @IBAction func BackButtonAction(sender: AnyObject) {
//        dismissViewControllerAnimated(true, completion: nil)
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func LikeButton(sender: UIButton) {
        if sender.selected == false {
            sender.selected = true
        }
        else {
            sender.selected = false
        }
    }


    @IBAction func CommentButton(sender: UIButton) {
        self.TouchCommentField.becomeFirstResponder()
        print("test")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paddingView = UIView(frame: CGRectMake(0, 0, 7, self.TouchCommentField.frame.height))

        TouchCommentField.leftView = paddingView
        
        TouchCommentField.leftViewMode = UITextFieldViewMode.Always
        
        ThrillistScrollView.contentSize = ThrillistImageView.image!.size
        
        // TouchCommentField.becomeFirstResponder()
        
        initialY = CommentBarParentView.frame.origin.y
        
        offset = -204
        
        NSNotificationCenter.defaultCenter().addObserver(self,selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object:nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self,selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object:nil)
                
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
