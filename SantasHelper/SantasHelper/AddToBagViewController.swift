//
//  AddToBagViewController.swift
//  SantasHelper
//
//  Created by Dustin Goodman on 10/4/16.
//  Copyright © 2016 Dustin Goodman. All rights reserved.
//

import UIKit



class AddToBagViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var bagCollectionView: UICollectionView!

    @IBOutlet weak var scannedImage: UIImageView!
    @IBOutlet weak var scannedProductTitle: UILabel!
    
    @IBOutlet weak var LoadingIndicator: UIActivityIndicatorView!
    var upcCode:String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bagCollectionView.dataSource = self
        bagCollectionView.delegate = self
        
        scannedProductTitle.alpha = 0
        scannedImage.alpha = 0
        
        self.LoadingIndicator.startAnimating()
        
        loadScannedProduct()
        print(upcCode)
        
         delay(2) {
            
             self.LoadingIndicator.stopAnimating()
            UIView.animateWithDuration(0.25, animations: { () -> Void in
                
                self.scannedProductTitle.alpha = 1
                self.scannedImage.alpha = 1
                self.LoadingIndicator.alpha = 0 
                
            })
    
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return myBags.count
    }
    
    func loadScannedProduct(){
        if upcCode == "0673419247092"{
        scannedImage.image = myProducts[0].image
        scannedProductTitle.text = myProducts[0].productName
        }else if upcCode == "0673419247085"{
            scannedImage.image = myProducts[1].image
            scannedProductTitle.text = myProducts[1].productName
            
        }
        
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        print("cool")
        let cell = bagCollectionView.dequeueReusableCellWithReuseIdentifier("santaBagsCell", forIndexPath: indexPath) as! santaBagCollectionViewCell
        let santaBaglist = myBags[indexPath.row]
        cell.santaBagImage.image = santaBaglist.icon
        cell.santaBagName.text = santaBaglist.bagName + " Santa Bag"
        
        
        print("WTf")
        return cell
        
        
        
        
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //let myBag = myBags[indexPath.row]
        performSegueWithIdentifier("productDetailSegue", sender: self)
        
    
        
        
        
        
        
        
    }

    
    
   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            
            let destinationViewController = segue.destinationViewController as! ProductDetailViewController
        
            destinationViewController.upcCode = upcCode!
            
            
        }

}
    

    
    
    

