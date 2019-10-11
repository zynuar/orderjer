//
//  Shop.swift
//  orderjer
//
//  Created by PPAS RATU SIX on 28/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class Shop {

    var shopName: String
    var location: String
    var mallName: String
    var shopType: ShopType
    
    init(shopName: String, location: String, mallName: String, shopType: ShopType) {
        self.shopName = shopName
        self.location = location
        self.mallName = mallName
        self.shopType = shopType
    }
}

enum ShopType: String {
    case food = "Food"
    case beverage = "Beverage"
}
