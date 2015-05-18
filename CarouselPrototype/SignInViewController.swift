//
//  SignInViewController.swift
//  CarouselPrototype
//
//  Created by Nan Chen on 5/16/15.
//  Copyright (c) 2015 Nan Chen. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var navHeaderImage: UIImageView!
    @IBOutlet weak var descriptionTextImage: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginFormImage: UIImageView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signInButtonImage: UIImageView!
    @IBOutlet weak var loginFormView: UIView!
    @IBOutlet weak var loginButtonView: UIView!
    
    var originalFormCenter: CGPoint!
    var originalButtonCenter: CGPoint!
    var originalTextCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()
        originalFormCenter = loginFormView.center
        originalButtonCenter = loginButtonView.center
        originalTextCenter = descriptionTextImage.center
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
        println(self.loginFormView.center)
        println(self.loginButtonView.center)
        println(self.descriptionTextImage.center)
        
    }

    func keyboardWillShow(notification: NSNotification!) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.loginFormView.frame.origin.y = -30
            self.loginButtonView.frame.origin.y = 230
            self.descriptionTextImage.center.y = -30
            println(self.loginFormView.center)
            println(self.loginButtonView.center)
            println(self.descriptionTextImage.center)
            }, completion: nil)
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.loginFormImage.center = self.originalFormCenter
            self.loginButtonView.center = self.originalButtonCenter
            self.descriptionTextImage.center = self.originalTextCenter
            
            }, completion: nil)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    @IBAction func didPressFields(sender: AnyObject) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.emailField.center.y = 100
            self.passwordField.center.y = 120
            self.loginFormImage.center.y = 100
            self.signInButton.center.y = -220
            self.signInButtonImage.center.y = -200
            self.descriptionTextImage.center.y = -300
        }, completion: nil)
        println(signInButton.center)
    }
        */

    @IBAction func touchOutside(sender: AnyObject) {

    }

    @IBAction func didPressSignInButton(sender: AnyObject) {
        
        if emailField.text.isEmpty {
            var alertView = UIAlertView(title: "Email Required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else if passwordField.text.isEmpty {
            var alertView = UIAlertView(title: "Password Required", message: "Please enter your password", delegate: self, cancelButtonTitle: "OK")
        } else {
            var loadingAlertView = UIAlertView(title: "Signing In...", message: nil, delegate: self, cancelButtonTitle: nil)
            loadingAlertView.show()
            
            delay(2) {
                loadingAlertView.dismissWithClickedButtonIndex(0, animated: true)
                
                if self.passwordField.text == "q" && self.emailField.text == "q" {
                    self.performSegueWithIdentifier("SignedIn", sender: nil)
                } else {
                    var alertView = UIAlertView(title: "Incorrect Password or Email", message: "Please re-enter your Email and Password", delegate: self, cancelButtonTitle: "OK")
                    alertView.show()

                }
                
                
            }

        }
        
        
    }
    
    
    @IBAction func didPressBackButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
