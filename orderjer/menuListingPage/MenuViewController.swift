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
    var optMeals: [OptMeal] = []
    var optDrinks: [OptDrinks] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readJson()
        imageBackground.roundCorners(.topLeft, radius: 50)
        shopsNameLabel.text = shopsName
        if shopsName == "KFC" {
            menuImage.image = UIImage(named: "cover menu kfc")
        } else if shopsName == "McDonald" {
            menuImage.image = UIImage(named: "cover menu mcd")
        } else if shopsName == "Tealive" {
            menuImage.image = UIImage(named: "cover menu tealive")
        } else if shopsName == "The Alley" {
            menuImage.image = UIImage(named: "cover menu the alley")
        } else if shopsName == "Tiger Sugar" {
            menuImage.image = UIImage(named: "cover menu tiger sugar")
        }
    }
    
    func readJson() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let json: NSArray = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! NSArray
            guard let array = json as? [Any] else { return }
            for shop in array {
                let shopDict = shop as? [String: Any]
                let shopName = shopDict?["shopName"]
//                print(shopName ?? "shopName not found")
                var foodName: String = ""
                var foodImg: String = ""
                var foodType: [Any] = []
                var drinkName: String = ""
                var drinkPrice: Double
                
                if shopsName == shopName as! String {
                    var tempMeals: [Meal] = []
                    var tempOptDrink: [OptDrinks] = []
                    for mealList in shopDict?["mainCourse"] as! [Dictionary<String, AnyObject>]{
                        foodName = mealList["foodName"] as! String
                        print(foodName)
                        foodImg = mealList["foodImg"] as! String
                        foodType = mealList["type"] as! [Any]
                        print(foodType)
                        let meal = Meal(mealImage: UIImage(named: foodImg)!, mealName: foodName, mainCourse: foodType)
                        tempMeals.append(meal)
                        meals = tempMeals
                    }
                    for drinkOptList in shopDict?["drinks"] as! [Dictionary<String, AnyObject>]{
                        drinkName = drinkOptList["drinkName"] as! String
                        print(drinkName)
                        drinkPrice = drinkOptList["drinkPrice"] as! Double
                        let drinkOptArray = OptDrinks(optDrinksName: drinkName, optDrinksPrice: drinkPrice)
                        tempOptDrink.append(drinkOptArray)
                        optDrinks = tempOptDrink
                    }
                }
            }
        } catch {
            print(error.localizedDescription)
            
        }
        
    }
    
}

extension MenuViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
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
            destination.mealOptDrinks = optDrinks
            destination.shopName = shopsName
        }
    }



}
