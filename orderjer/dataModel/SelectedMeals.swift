//
//  SelectedMeals.swift
//  orderjer
//
//  Created by Izzaty on 25/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class SelectedMeals {
    
    var selectedMealName: String
    var selectedOptions: String
    var selectedDrinks: String?
    var selectedMealPrice: Double
    var selectedMealQuantity: Int
    
    init(selectedMealName: String, selectedOptions: String, selectedDrinks: String?, selectedMealPrice: Double, selectedMealQuantity: Int) {
        self.selectedMealName = selectedMealName
        self.selectedOptions = selectedOptions
        self.selectedMealPrice = selectedMealPrice
        self.selectedMealQuantity = selectedMealQuantity
    }
}
