//
//  Shop.swift
//  orderjer
//
//  Created by PPAS RATU SIX on 28/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class Shop {
//    shopName: "mcd", shopLocation: "Damansara"
    var shopName: String
    var location: String
    var mallName: String
    var mainCourse: [Meal]
    var drinks: [OptDrinks]
    
    init(shopName: String, location: String, mallName: String, mainCourse: [Meal], drinks: [OptDrinks]) {
        self.shopName = shopName
        self.location = location
        self.mallName = mallName
        self.mainCourse = mainCourse
        self.drinks = drinks
    }
}
