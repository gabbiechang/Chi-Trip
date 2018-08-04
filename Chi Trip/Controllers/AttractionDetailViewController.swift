//
//  AttractionDetailViewController.swift
//  Chi Trip
//
//  Created by Gabbie on 7/31/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import UIKit

class AttractionDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var attractionDetailImage: UIImageView!
    @IBOutlet weak var attractionNameLabel: UILabel!
    @IBOutlet weak var attractionDescriptionLabel: UILabel!
    @IBOutlet weak var addToFavsButton: UIButton!
    
    // MARK: - Properties
    
    var attraction: Attraction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }
    
    
    func setupViews() {
        
        attractionNameLabel.text = attraction?.name
        
        guard let imageURL = URL(string: (attraction?.imageURL)!) else { return assertionFailure("Image URL failed")}
        let imageData = try? Data(contentsOf: imageURL)
        attractionDetailImage.image = UIImage(data: imageData!)
        
    }
    
    // MARK: - IBActions
    
    @IBAction func addToFavoritesButton(_ sender: UIButton) {
        
        let favorite = CoreDataHelper.newFavorite()
        favorite.descrip = ""
        favorite.name = attraction?.name
//        favorite.coordinate =
        
        guard let imageURL = URL(string: (attraction?.imageURL)!) else { return assertionFailure("Image URL failed")}
        let imageData = try? Data(contentsOf: imageURL)
        favorite.image = imageData
        
        CoreDataHelper.saveFavorite()
        
//        if addToFavsButton.backgroundColor == UIColor.red {
//            addToFavsButton.backgroundColor = UIColor.purple
//        }
//        else if addToFavsButton.backgroundColor == UIColor.purple {
//            addToFavsButton.backgroundColor = UIColor.red
//        }
//
//        addToFavsButton.setTitleColor(UIColor.blue, for: UIControlState.selected)

        
    }
    
}
