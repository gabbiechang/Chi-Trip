//
//  CoreDataHelper.swift
//  Chi Trip
//
//  Created by Gabbie on 8/1/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct CoreDataHelper {
    
    static let context: NSManagedObjectContext = {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        //        let privateCton = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        //        privateCton.persistentStoreCoordinator = self
        
        return context
    }()
    
    static func newFavorite() -> Favorite {
        let favorite = NSEntityDescription.insertNewObject(forEntityName: "Favorite", into: context) as! Favorite
        return favorite
    }
    
    static func saveFavorite() {
        do {
            try context.save()
        } catch let error {
            print("Failed to save favorite:", error)
        }
    }
    
    static func deleteFavorite(favorite: Favorite) {
        context.delete(favorite)
        saveFavorite()
    }
    
    static func retrieveFavorites() -> [Favorite] {
        
        do {
            // 1. Create a Fetch Request to every note
            let fetchRequest: NSFetchRequest = NSFetchRequest<Favorite>(entityName: "Favorite")
            // 2. Context will return an array of notes
            let fetchResults = try context.fetch(fetchRequest)
            return fetchResults
            
        } catch let error {
            // 3. If the fetch request fails, return an empty array
            print("Failed to fetch favroites:", error)
            return []
        }
        
    }
    
}
