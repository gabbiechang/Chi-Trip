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
        
        What is it?
        
        \(self.attraction.whatDescription)
        
        Why come?
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
        //logikkk for setup button
    }
    
    // MARK: - IBActions
    
    @IBAction func addToFavoritesButton(_ sender: UIButton) {
        
        let favorite = CoreDataHelper.newFavorite()
        favorite.descrip = ""
        favorite.name = attraction.name
        favorite.lat = attraction.coordinate.latitude
        favorite.long = attraction.coordinate.longitude
        
        guard let imageURL = URL(string: (attraction?.imageURL)!) else { return assertionFailure("Image URL failed")}
        //TODO: store images in the file base
        let imageData = try? Data(contentsOf: imageURL)
        favorite.image = imageData
        
        CoreDataHelper.save()
        
        setupButton()
//        let lightBlue = UIColor(red: 1, green: 165/255, blue: 233, alpha: 1)
//        let mediumBlue = UIColor(red: 1, green: 165/255, blue: 233, alpha: 1)
//        let darkBlue = UIColor(red: 7.1, green: 10.6/255, blue: 14.1, alpha: 1)
//        let lightPurple = UIColor(red: 1, green: 165/255, blue: 233, alpha: 1)

        
//        if addToFavsButton.backgroundColor == UIColor.darkBlue {
//            addToFavsButton.backgroundColor = UIColor.mediumBlue
//        }
//        else if addToFavsButton.backgroundColor == UIColor.mediumBlue {
//            addToFavsButton.backgroundColor = UIColor.darkBlue
//        }
//
//        addToFavsButton.setTitleColor(UIColor.blue, for: UIControlState.selected)

        
    }
    
}
