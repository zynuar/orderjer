//
//  OptDrinks.swift
//  orderjer
//
//  Created by PPAS RATU SIX on 28/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class OptDrinks {

    var optDrinksName: String
    var optDrinksPrice: Double
    var type: String

    init(optDrinksName: String, optDrinksPrice: Double, type: String) {
        self.optDrinksName = optDrinksName
        self.optDrinksPrice = optDrinksPrice
        self.type = type
    }
}
