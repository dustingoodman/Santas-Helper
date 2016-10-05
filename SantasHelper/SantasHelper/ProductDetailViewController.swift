//
//  ProductDetailViewController.swift
//  SantasHelper
//
//  Created by Dustin Goodman on 10/5/16.
//  Copyright © 2016 Dustin Goodman. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var ProductTitle: UILabel!
    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var SantaMessage: UITextField!
    
    var upcCode:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SantaMessage.text = "Send a special Message to Santa"
        
       
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
