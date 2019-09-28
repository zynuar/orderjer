//
//  OptMeals.swift
//  orderjer
//
//  Created by PPAS RATU SIX on 28/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//
import UIKit

class OptMeal {

    var optName: String
    var optPrice: Double
    var type: String

    init(optName: String, optPrice: Double, type: String) {
        self.optName = optName
        self.optPrice = optPrice
        self.type = type
    }
}
