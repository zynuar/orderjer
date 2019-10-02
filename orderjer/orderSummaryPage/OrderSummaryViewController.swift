//
//  OrderSummaryViewController.swift
//  orderjer
//
//  Created by Izzaty on 20/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class OrderSummaryViewController: UIViewController {
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var proceedButton: UIButton!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var serviceTaxLabel: UILabel!
    @IBOutlet weak var orderFeeLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var mealsName = ""
    var getMeals: [SelectedMeals] = []
    var getSelectedMeals: [Any] = []
    var getSelectedDrinks: [Any] = []
    var quantity: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proceedButton.layer.cornerRadius = 8
        getMeals = createArray()
        debugPrint("getSelectedMeals -> \(getSelectedMeals.nameType)")
        debugPrint("getSelectedDrinks -> \(getSelectedDrinks)")
    }
    
    private func createArray() -> [SelectedMeals] {

        var tempMeals: [SelectedMeals] = []
//        var selectedOptions: String = ""
//        var selectedDrinks: String = ""
//        var foodPrice: Double
//        var drinkPrice: Double
//        for order in getSelectedMeals  as! [Dictionary<String, AnyObject>] {
//            selectedOptions = order["nameType"] as! String
//            selectedDrinks = order["drinkName"] as! String
//            foodPrice = order["foodPrice"] as! Double
//            drinkPrice = order["drinkPrice"] as! Double
//            let newPrice = foodPrice + drinkPrice
            let orderSummary = SelectedMeals(selectedMealName: "mealsName", selectedOptions: "selectedOptions", selectedDrinks: "selectedDrinks" , selectedMealPrice: 0.00, selectedMealQuantity: quantity)
            tempMeals.append(orderSummary)
//        }
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
