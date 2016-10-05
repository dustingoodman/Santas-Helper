//
//  HomeScreenViewController.swift
//  SantasHelper
//
//  Created by Camous, Dani on 10/4/16.
//  Copyright © 2016 Dustin Goodman. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
   
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var santasBagButton: UIButton!
    @IBOutlet weak var addItemButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addButton(sender: AnyObject) {
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
