//
//  MealOptionsTableViewCell.swift
//  orderjer
//
//  Created by Izzaty on 20/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class MealOptionsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var mealItem: OptMeal!
    var drinksItem: OptDrinks!
    
    func setOptMeals(meal: OptMeal){
        mealItem = meal
        titleLabel.text = meal.optName
        detailLabel.text = "\(meal.optPrice)"
    }
    
    func setOptDrinks(drink: OptDrinks){
        drinksItem = drink
        titleLabel.text = drink.optDrinksName
        detailLabel.text = "\(drink.optDrinksPrice)"
    }
}