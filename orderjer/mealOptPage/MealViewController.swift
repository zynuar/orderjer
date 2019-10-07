//
//  MealViewController.swift
//  orderjer
//
//  Created by Izzaty on 19/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MealViewController: UIViewController {
   
    @IBOutlet weak var mealOptionsTableView: UITableView!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var singleMealImageView: UIImageView!
    @IBOutlet weak var selectedMealNameLabel: UILabel!
    @IBOutlet weak var placeOrderButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var quantityLabel: UILabel!
    
    var selectedMeal: Meal?
    var mealOptMeals: [Any] = []
    var mealOptDrinks: [Any] = []
    var selectedRows = [String:IndexPath]()
    var getMeals: [OptMeal] = []
    var getDrinks: [OptDrinks] = []
    let sections = ["Options","Drinks"]
    // initialize empty array
    var optMeals: [OptMeal] = []
    var optDrinks: [OptDrinks] = []
    var completeMeal: [SelectedMeals] = []
    var quantity: Int = 1
    var shopName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quantityLabel.text = "1"
        print("mainCourse -> \((selectedMeal?.mainCourse)!)")
        print("shopName -> \((shopName))")
        selectedMealNameLabel.text = "\((selectedMeal?.mealName)!)"
        singleMealImageView.image = selectedMeal?.mealImage

        imageBackground.roundCorners(.topLeft, radius: 50)
        placeOrderButton.layer.cornerRadius = 8
        placeOrderButton.layer.borderWidth = 2.5
        placeOrderButton.layer.borderColor = UIColor.white.cgColor
        
        optMeals = createOptMealArray()
        optDrinks = createOptDrinkArray()

    }
    
    func createOptMealArray() -> [OptMeal] {
        var tempMeals: [OptMeal] = []
        var nameType: String = ""
        var foodPrice: Double
        for optMeals in selectedMeal!.mainCourse as! [Dictionary<String, AnyObject>]{
            nameType = optMeals["nameType"] as! String
            foodPrice = optMeals["foodPrice"] as! Double
            let optMeal = OptMeal(optName: nameType, optPrice: foodPrice)
            tempMeals.append(optMeal)
        }
        return tempMeals
    }
    
    func createOptDrinkArray() -> [OptDrinks] {
        var tempMeals: [OptDrinks] = []
        tempMeals = mealOptDrinks as! [OptDrinks]
        return tempMeals
    }
    

    @IBAction func dismissTapped(_ sender: UIButton) {
          dismiss(animated: true, completion: nil)
    }

    @IBAction func placeorderButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toOrderSummary", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOrderSummary" {
            if let destination = segue.destination as? OrderSummaryViewController {
                destination.mealsName = selectedMeal!.mealName
                destination.getSelectedMealName = getMeals[0].optName
                destination.getSelectedDrinkName = getDrinks[0].optDrinksName
                destination.quantity = quantity
                destination.shopName = shopName
                
                let totalPrice = (getMeals[0].optPrice + getDrinks[0].optDrinksPrice) * Double(quantity)
                destination.totalPrice = totalPrice
            }
        }
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        self.quantity += 1
        self.quantityLabel.text = String(self.quantity)
    }
    
    @IBAction func minusButton(_ sender: UIButton) {
        self.quantity -= 1
        if quantity < 1 {
            quantity = 1
        }
        self.quantityLabel.text = String(self.quantity)
    }
}

extension MealViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let counts: Int
        if section == 0 {
            counts = optMeals.count
        } else {
            counts = optDrinks.count
        }
        return counts
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! MealOptionsTableViewCell
        let previusSelectedCellIndexPath = self.addSelectedCellWithSection(indexPath);
        // how to add selected meal and drinks into an array
        if indexPath.section == 0 {
            getMeals = [OptMeal(optName: optMeals[indexPath.row].optName, optPrice: optMeals[indexPath.row].optPrice)]
        } else {
            getDrinks = [OptDrinks(optDrinksName: optDrinks[indexPath.row].optDrinksName, optDrinksPrice: optDrinks[indexPath.row].optDrinksPrice)]
        }

        print(getMeals)
        print(getDrinks)
        
        if(previusSelectedCellIndexPath != nil)
        {
            let previusSelectedCell = tableView.cellForRow(at: previusSelectedCellIndexPath!) as! MealOptionsTableViewCell
            let highlightedImg = UIImage(named: "highlighted")!
            
            let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            imgView.image = UIImage(named: "unselect")!
            previusSelectedCell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            previusSelectedCell.accessoryView = UIImageView(image: imgView.image, highlightedImage: highlightedImg)
            
            let imgView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            imgView2.image = UIImage(named: "selected")!
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            cell.accessoryView = UIImageView(image: imgView2.image, highlightedImage: highlightedImg)
            
           
            tableView.deselectRow(at: previusSelectedCellIndexPath!, animated: true)
        }
        else
        {
            let imgView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            imgView2.image = UIImage(named: "selected")!
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
            let highlightedImg = UIImage(named: "highlighted")!
            cell.accessoryView = UIImageView(image: imgView2.image, highlightedImage: highlightedImg)
        }
        
        for selectedIndexPath: IndexPath in tableView.indexPathsForSelectedRows!
        {
            if selectedIndexPath.section == indexPath.section
            {
                let imgView2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                imgView2.image = UIImage(named: "selected")!
                cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
                let highlightedImg = UIImage(named: "highlighted")!
                cell.accessoryView = UIImageView(image: imgView2.image, highlightedImage: highlightedImg)
                
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealOptCell") as! MealOptionsTableViewCell
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imgView.image = UIImage(named: "unselect")!
        let highlightedImg = UIImage(named: "highlighted")!
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        cell.accessoryView = UIImageView(image: imgView.image, highlightedImage: highlightedImg)
        
        if indexPath.section == 0 {
            let meal = optMeals[indexPath.row]
            cell.setOptMeals(meal: meal)
        } else {
            let drink = optDrinks[indexPath.row]
            cell.setOptDrinks(drink: drink)
        }
        return cell
    }

    func addSelectedCellWithSection(_ indexPath:IndexPath) -> IndexPath? {
        let existingIndexPath = selectedRows["\(indexPath.section)"]
        selectedRows["\(indexPath.section)"] = indexPath
        return existingIndexPath
    }

    func indexPathIsSelected(_ indexPath:IndexPath) ->Bool {
        if let selectedIndexPathInSection = selectedRows["\(indexPath.section)"] {
            if(selectedIndexPathInSection.row == indexPath.row) {
                return true
            }
        }
        return false
    }
    
}

//                var ref: DatabaseReference!
//                ref = Database.database().reference()
//                let mealsRef = ref.child("order")
//                //create data
//                var dict = [String: Any]()
//                dict.updateValue(selectedMeal!.mealName, forKey: "name")
//                dict.updateValue(quantity, forKey: "quantity")
//                dict.updateValue(getMeals[0].optName, forKey: "mealName")
//                dict.updateValue(getMeals[0].optPrice, forKey: "mealPrice")
//                dict.updateValue(getDrinks[0].optDrinksName, forKey: "drinkName")
//                dict.updateValue(getDrinks[0].optDrinksPrice, forKey: "drinkPrice")
//                //dict.updateValue("photo\(name)", forKey: "photo")
//                //dict.updateValue(rating, forKey: "rating")
//                mealsRef.child("customer1").setValue(dict)
