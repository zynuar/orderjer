//
//  SearchViewController.swift
//  orderjer
//
//  Created by Izzaty on 26/09/2019.
//  Copyright © 2019 Izzaty. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var searchBarTextField: UITextField!
    @IBOutlet weak var tableViewList: UITableView!
    
    var shopsArray: [Shop] = Array()
    var searchArray: [Shop] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        readJson()
    }
    
    func readJson() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            guard let array = json as? [Any] else { return }
            for shop in array {
                let shopDict = shop as? [String: Any]
                let shopName = shopDict?["shopName"]
                print(shopName ?? "shopName not found")
                let location = shopDict?["location"]
                print(location ?? "location not found")
                let mallName = shopDict?["mallName"]
                print(mallName ?? "mallName not found")
                shopsArray.append(Shop(shopName: shopName as! String, location: location as! String, mallName: mallName as! String))
            }
            print("shopsArray-> \(shopsArray)")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchListCell") as! SearchTableViewCell
        cell.searchArrayImageView.image = UIImage(named: shopsArray[indexPath.row].shopName)
        return cell
    }
    
}
