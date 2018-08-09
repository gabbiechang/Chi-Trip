//
//  FavoritesViewController.swift
//  Chi Trip
//
//  Created by Gabbie on 8/1/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var favorite = [Favorite]()
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            self.favorite.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            break
        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        favorite = CoreDataHelper.retrieveFavorites()
        print(favorite.count)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorite.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttractionsTableViewCell", for: indexPath) as! AttractionsTableViewCell
        let favorite = self.favorite[indexPath.row]
        cell.cityAttractionLabel?.text = favorite.name!
        cell.cityImageView?.image = favorite.image
        
        return cell
    }

}
