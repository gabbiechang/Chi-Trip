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
    
    var lastCityTapped: String?
    let topCities = ["Chicago, IL", "San Francisco, CA", "Los Angeles, CA", "New York City, NY", "Las Vegas, NV", "Boston, MA", "Washington, DC", "Orlando, FL", "Miami, FL"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return topCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityTableViewCell", for: indexPath) as! BigCitiesTableViewCell
        let city = topCities[indexPath.row]
        
        cell.cityLabel.text = city
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lastCityTapped = topCities[indexPath.row]
        self.performSegue(withIdentifier: "exploreToAttractions", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1
        guard let identifier = segue.identifier else { return }
        
        // 2
        if identifier == "exploreToAttractions" {
            let destination = segue.destination as! AttractionsTableViewController
            destination.city = lastCityTapped
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


