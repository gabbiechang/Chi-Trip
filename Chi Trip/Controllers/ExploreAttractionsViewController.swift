//
//  AttractionsTableViewController.swift
//  Chi Trip
//
//  Created by Gabbie on 7/24/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import UIKit
import Kingfisher

class ExploreAttractionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var attractions = listOfAttractions

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        // Do any additional setup after loading the view.
        
        
//        NetworkManager.getAttractions { (attractions) in
//            self.attractions = attractions
//        }
    }

}

extension ExploreAttractionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        print(attractions.count)
        return attractions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "attractionsTableViewCell", for: indexPath) as! AttractionsTableViewCell
        
        let attraction = attractions[indexPath.row]
        
        cell.cityAttractionLabel.text = attraction.name
        
        
        let imageURL = URL(string: attraction.imageURL)
//        guard let imageURL = URL(string: (attraction.imageURL)) else { return assertionFailure("Image URL failed")}
        
        cell.cityImageView.kf.setImage(with: imageURL)
        
//        let imageData = try? Data(contentsOf: imageURL!)
//        cell.cityImageView.image = UIImage(data: imageData!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        self.performSegue(withIdentifier: "attractionsDetailSegue", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "attractionsDetailSegue" {
            
            guard let indexPath = tableView.indexPathForSelectedRow else {return }
            let attraction = attractions[indexPath.row]
            
            let attractionDetailViewController = segue.destination as! AttractionDetailViewController
            attractionDetailViewController.attraction = attraction
        }
    }
    
}
