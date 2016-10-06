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
    @IBOutlet weak var SantaMessageBlock: UIView!
    @IBOutlet weak var ModalBackground: UIView!
    
    var upcCode:String!
    var initialY: CGFloat!
    var offsetY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
       loadScannedProduct()
        
        navigationItem.title = "Jake's"
        
        SantaMessage.layer.cornerRadius = 3
        SantaMessage.layer.borderColor = (UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)).CGColor
        SantaMessage.layer.borderWidth = 1
        
        initialY = SantaMessageBlock.frame.origin.y
        ModalBackground.alpha = 0
        offsetY = -200
        
         NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
       
        // Do any additional setup after loading the view.
    }
    
    func keyboardWillShow (notification: NSNotification!) {
        
       
        
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            
            self.SantaMessageBlock.frame.origin.y = self.initialY + self.offsetY
             self.ModalBackground.alpha = 0.5
            
            
        })
        
    }
    
    func loadScannedProduct(){
        if upcCode == "0673419247092"{
            ProductTitle.text = myProducts[0].productName
            ProductImage.image = myProducts[0].image
        }else if upcCode == "0673419247085"{
            ProductTitle.text = myProducts[1].productName
            ProductImage.image = myProducts[1].image
            
        }
        
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
