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
    
    let lightAqua = UIColor(red: 150/255, green: 187/255, blue: 187/255, alpha: 1.0)

    
    // MARK: - IBOutlets
    
    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var attractionNameLabel: UILabel!
    @IBOutlet weak var addToFavsButton: UIButton!
    
    var hasUserAlreadyAddedAttraction: Bool {
        let favorites = CoreDataHelper.retrieveFavorites()
        
        return favorites.contains(where: { (aFavorite) -> Bool in
            return aFavorite.title == attraction.title
        })
    }
    
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
        
        \(self.attraction.whatDescription)
        
        \(self.attraction.whyDescription)
        
        """
        descriptionLabel.text = combinedTextView
        
        
        guard let imageURL = URL(string: (attraction?.imageURL)!) else { return assertionFailure("Image URL failed")}
        
        imageView.kf.setImage(with: imageURL)
//
//        let imageData = try? Data(contentsOf: imageURL)
//        attractionDetailImage.image = UIImage(data: imageData!)
//
        
        //enable or disable button
        setupButton()
    }
    
    func setupButton() {
        if CoreDataHelper.contains(attraction) != nil {
            addToFavsButton.setTitle("Remove from Favorites", for: .normal)
        } else {
            addToFavsButton.setTitle("Add to Favorites", for: .normal)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupButton()
    }
    
    // MARK: - IBActions
    
    @IBAction func addToFavoritesButton(_ sender: UIButton) {
        
        
        if let favoriteToRemove = CoreDataHelper.contains(attraction) {
            
            CoreDataHelper.deleteFavorite(favorite: favoriteToRemove)
        } else {
            
            let favorite = CoreDataHelper.newFavorite()
            favorite.descrip = ""
            favorite.name = attraction.name
            favorite.lat = attraction.coordinate.latitude
            favorite.long = attraction.coordinate.longitude
            favorite.tinyDescription = attraction.tinyDescription
            favorite.address = attraction.address
            
            //        guard let imageURL = URL(string: (attraction?.imageURL)!) else { return assertionFailure("Image URL failed")}
            //        //TODO: store images in the file base
            //        let imageData = try? Data(contentsOf: imageURL)
            //        favorite.image = imageData
            //
            favorite.image = imageView.image!
        }
        
        CoreDataHelper.save()
        
        setupButton()

        
    }
    
}
