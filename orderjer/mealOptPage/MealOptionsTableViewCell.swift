//
//  MealOptionsTableViewCell.swift
//  orderjer
//
//  Created by Izzaty on 20/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class MealOptionsTableViewCell: UITableViewCell {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var mealItem: OptMeal!
    var drinksItem: OptDrinks!
    
    func setOptMeals(meal: OptMeal){
        mealItem = meal
        titleLabel.text = meal.optName
        detailLabel.text = "\(String(format: "RM %.2f", meal.optPrice))"
    }
    
    func setOptDrinks(drink: OptDrinks){
        drinksItem = drink
        titleLabel.text = drink.optDrinksName
        detailLabel.text = "\(String(format: "+RM %.2f", drink.optDrinksPrice))"
    }
}
