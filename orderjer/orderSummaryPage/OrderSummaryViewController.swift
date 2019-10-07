//
//  OrderSummaryViewController.swift
//  orderjer
//
//  Created by Izzaty on 20/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit
import FirebaseDatabase

class OrderSummaryViewController: UIViewController {
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var serviceTaxLabel: UILabel!
    @IBOutlet weak var orderFeeLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var mealsName = ""
    var totalPrice: Double = 0.00
    var getMeals: [SelectedMeals] = []
    var getSelectedMeals: [OptMeal] = []
    var getSelectedDrinks: [OptDrinks] = []
    var quantity: Int = 1
    var selectedOption: String = ""
    var mealPrice: Double = 0.00
    var selectedDrinks: String = ""
    var drinkPrice: Double = 0.00
    var selectedMealPrice: Double = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proceedButton.layer.cornerRadius = 8
        getMeals = createArray()
        print("getSelectedMeals -> \(getSelectedMeals)")
        print("getSelectedDrinks -> \(getSelectedDrinks)")
    }
    
    private func createArray() -> [SelectedMeals] {
        //get from server
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let mealsRef = ref.child("order").child("customer1")
        mealsRef.observe(DataEventType.value, with: { (snapshot) in
            //clear local data
//            self.meals = []
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            for (key, value) in postDict {
                //print("\(key) -> \(value)")
                print(value["name"])
                //mealName = value["name"] as! String
                //mealImage = value["photo"] as! String
                //mealRating = value["rating"] as! Int
//                guard let meal = Meal(id: key,name: mealName, photo: UIImage(named: "meal1"), rating: mealRating) else {
//                    fatalError("Unable to create meal 1")
//                }
//                self.meals += [meal]
//                print("Amount of data from local \(self.meals.count)")
            }
//            //reload local data when get data from server
//            self.tableView.reloadData()
        })
        
        var tempMeals: [SelectedMeals] = []
        
        for item in getSelectedMeals {
            selectedOption = item.optName
            mealPrice = item.optPrice
        }
        for item2 in getSelectedDrinks{
            selectedDrinks = item2.optDrinksName
            drinkPrice = item2.optDrinksPrice
        }
        selectedMealPrice = (mealPrice + drinkPrice) * Double(quantity)
        self.subtotalLabel.text = String(selectedMealPrice)
        let arrayOf  = SelectedMeals(selectedMealName: mealsName, selectedOptions: selectedOption, selectedDrinks: selectedDrinks, selectedMealPrice: selectedMealPrice, selectedMealQuantity: quantity)
        tempMeals.append(arrayOf)
        return tempMeals
       
    }
    
    @IBAction func dismissTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension OrderSummaryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getMeals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = getMeals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderSummaryTableViewCell") as! OrderSummaryTableViewCell
        cell.layer.cornerRadius = 16.0
        cell.selectedMealNameLabel.text = meal.selectedMealName
        cell.selectedOptionLabel.text = meal.selectedOptions
        cell.selectedDrinkLabel.text = meal.selectedDrinks
        cell.selectedMealPrice.text = "RM \(meal.selectedMealPrice)"
        cell.selectedMealQuantity.text = "\(meal.selectedMealQuantity)"
        return cell
    }
}
