//
//  Meals.swift
//  orderjer
//
//  Created by Izzaty on 18/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class Meals {
    
    var name: String
    var image: UIImage
    var price: String
    
    init(name: String, image: UIImage, price: String) {
        self.name = name
        self.image = image
        self.price = price
    }
}
