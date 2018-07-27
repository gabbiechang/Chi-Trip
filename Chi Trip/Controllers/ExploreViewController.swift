//
//  ExploreViewController.swift
//  Chi Trip
//
//  Created by Gabbie on 7/26/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let topCities = ["Chicago", "San Francisco", "Los Angeles", "New York City", "Las Vegas", "Boston", "Washington", "Orlando", "Miami"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return topCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityTableViewCell", for: indexPath) as! BigCitiesTableViewCell
        cell.cityLabel.text = topCities[indexPath.row]
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


