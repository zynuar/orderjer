//
//  MenuViewController.swift
//  orderjer
//
//  Created by Izzaty on 18/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var mealList: UITableView!
    @IBOutlet weak var shopsNameLabel: UILabel!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var menuImage: UIImageView!

    var mealName = ""
    // initialize empty array
    var meals: [Meal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meals = createArray()
        imageBackground.roundCorners(.topLeft, radius: 50)
        shopsNameLabel.text = mealName
        if mealName == "kfc" {
            menuImage.image = UIImage(named: "cover menu kfc")
        } else if mealName == "mcd" {
            menuImage.image = UIImage(named: "cover menu mcd")
        } else if mealName == "tealive" {
            menuImage.image = UIImage(named: "cover menu tealive")
        }
    }
    
    func createArray() -> [Meal] {
        var tempMeals: [Meal] = []
        if mealName == "kfc" {
            
            let meal1 = Meal(mealImage: UIImage(named: "snack-plate")!, mealName: "Snack Plate", mealPrice: "RM 10.00")
            let meal2 = Meal(mealImage: UIImage(named: "dinner-plate")!, mealName: "Dinner Plate", mealPrice: "RM 15.00")
            let meal3 = Meal(mealImage: UIImage(named: "family-feast")!, mealName: "Family Feast", mealPrice: "RM 53.00")
            
            tempMeals.append(meal1)
            tempMeals.append(meal2)
            tempMeals.append(meal3)
            
        } else if mealName == "mcd" {
            let meal1 = Meal(mealImage: UIImage(named: "big-mac")!, mealName: "Big Mac", mealPrice: "RM 10.00")
            let meal2 = Meal(mealImage: UIImage(named: "ayam-goreng-mcd")!, mealName: "Ayam Goreng Mcd", mealPrice: "RM 15.00")
            let meal3 = Meal(mealImage: UIImage(named: "double-cheese-burger")!, mealName: "Double Cheese Burger", mealPrice: "RM 12.00")
            
            tempMeals.append(meal1)
            tempMeals.append(meal2)
            tempMeals.append(meal3)
        } else if mealName == "tealive" {
            menuImage.image = UIImage(named: "cover menu tealive")
        }
        return tempMeals
    }
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = meals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell") as! MealTableViewCell
        cell.layer.cornerRadius = 16.0
        cell.setMeals(meal: meal)
        
        return cell
    }
    
}
