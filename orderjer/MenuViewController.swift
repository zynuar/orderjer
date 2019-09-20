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
    
    var shopsName = ""
    // initialize empty array
    var meals: [Meal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meals = createArray()
        imageBackground.roundCorners(.topLeft, radius: 50)
        shopsNameLabel.text = shopsName
        if shopsName == "kfc" {
            menuImage.image = UIImage(named: "cover menu kfc")
        } else if shopsName == "mcd" {
            menuImage.image = UIImage(named: "cover menu mcd")
        } else if shopsName == "tealive" {
            menuImage.image = UIImage(named: "cover menu tealive")
        }
    }
    
    func createArray() -> [Meal] {
        var tempMeals: [Meal] = []
        if shopsName == "kfc" {
            
            let meal1 = Meal(mealImage: UIImage(named: "snack-plate")!, mealName: "Snack Plate", mealPrice: "RM 10.00")
            let meal2 = Meal(mealImage: UIImage(named: "dinner-plate")!, mealName: "Dinner Plate", mealPrice: "RM 15.00")
            let meal3 = Meal(mealImage: UIImage(named: "zinger-burger")!, mealName: "Zinger Burger", mealPrice: "RM 18.00")
            let meal4 = Meal(mealImage: UIImage(named: "wrap-cheezy")!, mealName: "Cheezy Wrap", mealPrice: "RM 12.00")
            let meal5 = Meal(mealImage: UIImage(named: "family-feast")!, mealName: "Family Feast", mealPrice: "RM 53.00")
            tempMeals.append(meal1)
            tempMeals.append(meal2)
            tempMeals.append(meal3)
            tempMeals.append(meal4)
            tempMeals.append(meal5)
            
        } else if shopsName == "mcd" {
            
            let meal1 = Meal(mealImage: UIImage(named: "big-mac")!, mealName: "Big Mac", mealPrice: "RM 10.00")
            let meal2 = Meal(mealImage: UIImage(named: "ayam-goreng-mcd")!, mealName: "Ayam Goreng Mcd", mealPrice: "RM 15.00")
            let meal3 = Meal(mealImage: UIImage(named: "double-cheese-burger")!, mealName: "Double Cheese Burger", mealPrice: "RM 12.00")
            let meal4 = Meal(mealImage: UIImage(named: "double-quarter-pounder")!, mealName: "Double Quarter Pounder", mealPrice: "RM 19.00")
            let meal5 = Meal(mealImage: UIImage(named: "grilled-chicken-burger")!, mealName: "Grilled Chicken Burger", mealPrice: "RM 12.00")
            tempMeals.append(meal1)
            tempMeals.append(meal2)
            tempMeals.append(meal3)
            tempMeals.append(meal4)
            tempMeals.append(meal5)
            
        } else if shopsName == "tealive" {
            
            let meal1 = Meal(mealImage: UIImage(named: "Passion Fruit Tea")!, mealName: "Passion Fruit Tea", mealPrice: "RM 10.00")
            let meal2 = Meal(mealImage: UIImage(named: "Radiant Roselle Tea")!, mealName: "Radiant Roselle Tea", mealPrice: "RM 15.00")
            let meal3 = Meal(mealImage: UIImage(named: "Signature Brown Sugar Pearl Milk Tea")!, mealName: "Signature Brown Sugar Pearl Milk Tea", mealPrice: "RM 12.00")
            let meal4 = Meal(mealImage: UIImage(named: "Strawberry Pudding Smoothies")!, mealName: "Strawberry Pudding Smoothies", mealPrice: "RM 19.00")
            let meal5 = Meal(mealImage: UIImage(named: "Superior Coco with Sea Salt Cheese")!, mealName: "Superior Coco with Sea Salt Cheese", mealPrice: "RM 12.00")
            tempMeals.append(meal1)
            tempMeals.append(meal2)
            tempMeals.append(meal3)
            tempMeals.append(meal4)
            tempMeals.append(meal5)
            
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "MealView", sender: nil)
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = meals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell") as! MealTableViewCell
        cell.layer.cornerRadius = 16.0
        cell.setMeals(meal: meal)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // send data to MealViewController
        if let destination = segue.destination as? MealViewController {
            destination.selectedMeal = meals[(mealList.indexPathForSelectedRow?.row)!]
        }
    }
    
    
    
}
