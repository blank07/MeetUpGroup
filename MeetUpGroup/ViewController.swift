//
//  ViewController.swift
//  MeetUpGroup
//
//  Created by Pro on 2/04/2016.
//  Copyright © 2016 RMIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var pswField: UITextField!
    
    var loginModel = LoginModel()
    
    @IBAction func loginBtnPressed(sender: UIButton) {
        let checkUser = loginModel.checkUser((emailField.text)!, psw: (pswField.text)!)
        if(checkUser) {
            
        } else {
            let controller = UIAlertController(title: "Invalid email or password", message: "Please try again", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            controller.addAction(okAction)
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func signUpBtnPressed(sender: UIButton) {
        //jump to sign up page
    }
    
    @IBAction func onTapGestureRecognized(sender: AnyObject) {
        emailField.resignFirstResponder()
        pswField.resignFirstResponder()
    }
}

