//
//  LoginViewController.swift
//  Facebook
//
//  Created by Jared on 2/9/16.
//  Copyright © 2016 plainspace. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var LogoView: UIImageView!
    
    
    @IBOutlet weak var FieldParentView: UIView!
    
    @IBOutlet weak var EmailField: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!

    @IBOutlet weak var LoginButton: UIButton!

    @IBOutlet weak var LabelParentView: UIView!
    
    
    @IBOutlet weak var SignUpLink: UILabel!
    
    @IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!

    @IBAction func didPressLogin(sender: AnyObject) {
        
        ActivityIndicator.startAnimating()
        
        LoginButton.selected = true
        
        if EmailField.text == "asdf" && PasswordField.text == "asdf" {
            
            delay(2, closure: { () -> () in
                
                self.ActivityIndicator.stopAnimating()
                
                self.LoginButton.selected = false
                
                self.performSegueWithIdentifier("LoginSegue", sender: nil)
            
            })
           
            
        } else {
        
            delay(2, closure: { () -> () in
            
                self.ActivityIndicator.stopAnimating()
                
                self.LoginButton.selected = false
            
            })
            
            let alertController = UIAlertController(title: "Access denied", message: "Wrong user name and password", preferredStyle: .Alert)
            
            // create a cancel action
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
            
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
            
        }
        
    }
    
    @IBAction func DidTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    var initialYLogoView: CGFloat!
    var offsetLogoView: CGFloat!
    
    var initialYFieldParentView: CGFloat!
    var offsetFieldParentView: CGFloat!
    
    var initialYLabelParentView: CGFloat!
    var offsetLabelParentView: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialYLogoView = LogoView.frame.origin.y
        offsetLogoView = -34
        
        initialYFieldParentView = FieldParentView.frame.origin.y
        offsetFieldParentView = -70
        
        initialYLabelParentView = LabelParentView.frame.origin.y
        offsetLabelParentView = -234
        
        // let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        LogoView.frame.origin.y = initialYLogoView + offsetLogoView

        FieldParentView.frame.origin.y = initialYFieldParentView + offsetFieldParentView

        LabelParentView.frame.origin.y = initialYLabelParentView + offsetLabelParentView
        
        // SignUpLink.hidden = true
        
        self.SignUpLink.fadeOut()
        
        print("move parent views up")

    }
    
    func keyboardWillHide(notification: NSNotification!) {
        LogoView.frame.origin.y = initialYLogoView

        FieldParentView.frame.origin.y = initialYFieldParentView

        LabelParentView.frame.origin.y = initialYLabelParentView
        
        UIView.animateWithDuration(1.5, animations: {
            self.SignUpLink.alpha = 1.0
        })
        
        // SignUpLink.hidden = false

        self.SignUpLink.fadeIn()

        
        print("move parent views down")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func editingChanged(sender: AnyObject) {
        // create a conditional statement: if the username OR password fields are empty than...
        if EmailField.text!.isEmpty || PasswordField.text!.isEmpty {
            // set the button state to disabled
            LoginButton.enabled = false
            // otherwise
        } else {
            // set the button state to enabled
            LoginButton.enabled = true
        }
    }
    

    @IBAction func OnButtonPress(sender: AnyObject) {
        self.ActivityIndicator.startAnimating()
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
