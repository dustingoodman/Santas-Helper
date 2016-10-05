//
//  HomeScreenViewController.swift
//  SantasHelper
//
//  Created by Camous, Dani on 10/4/16.
//  Copyright © 2016 Dustin Goodman. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
   
    @IBAction func addButton(sender: AnyObject) {
    }

    @IBAction func giftbagButton(sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
