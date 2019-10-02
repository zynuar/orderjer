//
//  MealTableViewCell.swift
//  orderjer
//
//  Created by Izzaty on 19/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealPriceLabel: UILabel!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    var mealItem: Meal!
    
    func setMeals(meal: Meal){
        mealItem = meal
        mealImageView.image = meal.mealImage
        mealNameLabel.text = meal.mealName
    }
}
