//
//  AttractionDetailViewController.swift
//  Chi Trip
//
//  Created by Gabbie on 7/31/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class AttractionDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var attractionNameLabel: UILabel!
    @IBOutlet weak var addToFavsButton: UIButton!
    
    // MARK: - Properties
    
    var attraction: Attraction!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }
    
    
    func setupViews() {
        
        attractionNameLabel.text = self.attraction.name
//        imageView.image = listOfAttractions?.imageURL
        let combinedTextView = """
        What
        \(self.attraction.whatDescription)
        
        Why
        \(self.attraction.whyDescription)
        """
        descriptionLabel.text = combinedTextView
        
        
        guard let imageURL = URL(string: (attraction?.imageURL)!) else { return assertionFailure("Image URL failed")}
        
        imageView.kf.setImage(with: imageURL)
//
//        let imageData = try? Data(contentsOf: imageURL)
//        attractionDetailImage.image = UIImage(data: imageData!)
//
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
