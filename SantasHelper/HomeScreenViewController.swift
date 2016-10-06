//
//  HomeScreenViewController.swift
//  SantasHelper
//
//  Created by Camous, Dani on 10/4/16.
//  Copyright © 2016 Dustin Goodman. All rights reserved.
//

import UIKit

var firstTime = false

class HomeScreenViewController: UIViewController {
   
    

    @IBOutlet weak var SantaImage: UIImageView!
    @IBOutlet weak var DeerImage: UIImageView!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(firstTime == false){
         DeerImage.alpha = 0
        SantaImage.alpha = 0
        delay(0.5, closure: { () -> () in
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.DeerImage.frame.origin.x = 135
            self.SantaImage.frame.origin.x = 0
            self.DeerImage.alpha = 1
            self.SantaImage.alpha = 1
            
            firstTime = true
        
        
        })
        })
        }else{
            self.DeerImage.frame.origin.x = 135
            self.SantaImage.frame.origin.x = 0
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Segue!")
        
        
        let DestViewController = segue.destinationViewController as! UINavigationController
        _ = DestViewController.topViewController as! UPCScannerViewController
        
        
    }
    
    
}
