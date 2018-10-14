//
//  Favorite.swift
//  Chi Trip
//
//  Created by Gabbie on 8/7/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import UIKit.UIImage


extension Favorite {
    var image: UIImage {
        get {
            //get url from doc folder
            let fileManager = FileManager.default
            let documentURL = fileManager.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
            let imageURL = documentURL.appendingPathComponent(self.imagePath!)

            //get data from url
            let imageData = try! Data(contentsOf: imageURL)

            //get uiimage from data
            let image = UIImage(data: imageData)!
            return image
    }
        set{
            //get new value
            let newImage = newValue
            
            //create a filename
            let filePath = String(Date().timeIntervalSince1970)
            
            //get the documents url
            let fileManager = FileManager.default
            let documentURL = fileManager.urls(for:  FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first!
            
            //append filename to dataValue
            let imagePath = documentURL.appendingPathComponent("\(filePath).jpg")
            
            //change image to data
            let imageData = UIImageJPEGRepresentation(newImage, 0.1)!
            
            //store data at url
            try! imageData.write(to: imagePath, options: Data.WritingOptions.atomic)
            
            //update image file
            self.imagePath = imagePath.lastPathComponent
        }
}
}
