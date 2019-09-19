//
//  MealTableViewCell.swift
//  orderjer
//
//  Created by Izzaty on 19/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

protocol MealTableViewCellDelegate {
    func addMealTapped(mealName: String)
}

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealPriceLabel: UILabel!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var addMealButton: UIButton!
    
    var delegate: MealTableViewCellDelegate?
    
    func setMeals(meal: Meal){
        mealImageView.image = meal.mealImage
        mealNameLabel.text = meal.mealName
        mealPriceLabel.text = meal.mealPrice
    }
    
    @IBAction func addMealTapped(_ sender: UIButton) {
        
    }
}
