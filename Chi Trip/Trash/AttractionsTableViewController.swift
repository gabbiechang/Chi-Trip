//
//  AttractionsTableViewController.swift
//  Chi Trip
//
//  Created by Gabbie on 7/27/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import UIKit

class AttractionsTableViewController: UIViewController {
    
    var city: String!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewCell: UITableViewCell!
    
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var attractions = [Attraction]()
    
    
    
    
    
    //    let topCities = ["Chicago, IL", "San Francisco, CA", "Los Angeles, CA", "New York City, NY", "Las Vegas, NV", "Boston, MA", "Washington, DC", "Orlando, FL", "Miami, FL"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //
        //        NetworkManager.getAttractions()
        //            { (attractions) in
        //            self.attractions = attractions
        //            print(attractions.count)
        //            print(attractions)
        //        }
        //    }
        
        
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1
        guard let identifier = segue.identifier else { return }
        
        // 2
        //        if identifier == "exploreToAttractions" {
        //            let destination = segue.destination as! AttractionsTableViewController
        //            destination.city =
        //        }
    }
    
}

extension AttractionsTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return attractions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        let cell = tableView.dequeueReusableCell(withIdentifier: "attractionsTableViewCell", for: indexPath) as! AttractionsTableViewCell
        let youreMom = attractions[indexPath.row]
        cell.cityAttractionLabel.text = youreMom.name
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = attractions[indexPath.row]
        
        
        
        self.performSegue(withIdentifier: "exploreToAttractions", sender: self)
    }
    
}







