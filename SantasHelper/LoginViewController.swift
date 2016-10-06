//
//  LoginViewController.swift
//  SantasHelper
//
//  Created by Camous, Dani on 10/4/16.
//  Copyright © 2016 Dustin Goodman. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var logoSuperView: UIView!
        var initial: CGFloat!
        var offset: CGFloat!
    
    @IBOutlet weak var signinFieldView: UIView!
        var initialY: CGFloat!
        var offsetY: CGFloat!
    
    @IBOutlet weak var emailfield: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initial = logoSuperView.frame.origin.y
        offset = -45
        
        initialY = signinFieldView.frame.origin.y
        offsetY = -68
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }
    func keyboardWillShow (notification: NSNotification!) {
        logoSuperView.frame.origin.y = initial + offset
        signinFieldView.frame.origin.y = initialY + offsetY
    }
    
    func keyboardWillHide (notification: NSNotification!) {
        logoSuperView.frame.origin.y = initial
        signinFieldView.frame.origin.y = initialY
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
