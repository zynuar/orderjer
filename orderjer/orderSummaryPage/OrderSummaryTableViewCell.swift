//
//  OrderSummaryTableViewCell.swift
//  orderjer
//
//  Created by Izzaty on 25/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class OrderSummaryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var selectedMealNameLabel: UILabel!
    @IBOutlet weak var selectedOptionLabel: UILabel!
    @IBOutlet weak var selectedDrinkLabel: UILabel!
    @IBOutlet weak var selectedMealPrice: UILabel!
    @IBOutlet weak var selectedMealQuantity: UILabel!
    
    var selectedMealItem: SelectedMeals!
    
    func setSelectedMeals(meal: SelectedMeals){
        selectedMealItem = meal
        selectedMealNameLabel.text = meal.selectedMealName
        selectedOptionLabel.text = meal.selectedOptions
        selectedDrinkLabel.text = meal.selectedDrinks
        selectedMealPrice.text = "\(meal.selectedMealPrice)"
        selectedMealQuantity.text = "\(meal.selectedMealQuantity)"
    }

}
