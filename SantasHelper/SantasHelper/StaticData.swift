//
//  StaticData.swift
//  SantasHelper
//
//  Created by Dustin Goodman on 10/5/16.
//  Copyright © 2016 Dustin Goodman. All rights reserved.
//

import Foundation
import UIKit


struct productDetail {
    let image: UIImage
    let productName: String
    let productDetail: String
    let productPrice: String
    let productURL: String
    let productUPC: String
    
}

struct santaBags {
    let icon: UIImage
    let bagName: String
    
    
    
}


var myProducts = [(image:UIImage(named: "wookiee.jpg")!, productName: "LEGO Star Wars Wookiee™ Gunship 75129", productDetail: "", productPrice: "7.99", productURL: "", productUPC: "673419247085"),
                  (image:UIImage(named: "tifighter.jpg")!, productName: "LEGO Star Wars TIE Advanced Prototype™ 75128", productDetail: "", productPrice: "7.99", productURL: "", productUPC: "673419247085")]




var myBags = [(icon:UIImage(named: "santabag.png")!, bagName: "Jake's"),
              (icon:UIImage(named: "santabag.png")!, bagName: "Josh's")
]