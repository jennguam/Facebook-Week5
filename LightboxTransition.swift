//
//  LightboxTransition.swift
//  Facebook
//
//  Created by Jenn Leung on 3/4/16.
//  Copyright © 2016 plainspace. All rights reserved.
//

import UIKit

class LightboxTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        toViewController.view.alpha = 0
        toViewController.view.transform = CGAffineTransformMakeScale(0,0)
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            toViewController.view.transform = CGAffineTransformMakeScale(1,1)
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            fromViewController.view.transform = CGAffineTransformMakeScale(0.001,0.001)
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }

}
