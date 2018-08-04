//
//  Attractions.swift
//  Chi Trip
//
//  Created by Gabbie on 7/24/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import SwiftyJSON
import MapKit
import AddressBook

class Attraction: NSObject, MKAnnotation {
    
//    let lat: Double
    //description one too
//    let long: Double
    
    let name: String
    let imageURL: String
    let coordinate: CLLocationCoordinate2D
    
    
    init(name: String, imageURL: String, coordinate: CLLocationCoordinate2D)
    {
        self.name = name
        self.imageURL = imageURL
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return name
    }
    
    class func from(json: JSON) -> Attraction?
    {
        var title: String
        if let unwrappedTitle = json["name"].string {
            title = unwrappedTitle
        } else {
            title = ""
        }

        let locationName = json["location"]["address"].string
        let lat = json["location"]["lat"].doubleValue
        let long = json["location"]["lng"].doubleValue
        let imageURL = ""
        let coordinate = CLLocationCoordinate2D(latitude: 41.8781, longitude: -87.6298)

        return Attraction(name: locationName!, imageURL: imageURL, coordinate: coordinate)
    }

    func mapItem() -> MKMapItem
    {
        let addressDictionary = [String(kABPersonAddressStreetKey) : name]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        let mapItem = MKMapItem(placemark: placemark)

        mapItem.name = "\(name)"

        return mapItem
    }
}
    
    
//    //do i have to get rid of the "results"?
//
//    init(json: JSON) {
//        print(json)
//
//        self.name = json["name"].stringValue
//        self.imageURL = json["image_url"].stringValue
////        self.lat = json["coordinates"]["latitude"].doubleValue
////        self.long = json["coordinates"]["longitude"].doubleValue
//        //self.imageURL =  json[""].stringValue
//      //  self.description = json[].stringValue
//    }
//    
////    func mapItem() -> MKMapItem {
////
////    }
//
//}


//
//
//    var subtitle: String? {
//        return locationName
//    }
//
//    class func from(json: JSON) -> Venue?
//    {
//        var title: String
//        if let unwrappedTitle = json["name"].string {
//            title = unwrappedTitle
//        } else {
//            title = ""
//        }
//
//        let locationName = json["location"]["address"].string
//        let lat = json["location"]["lat"].doubleValue
//        let long = json["location"]["lng"].doubleValue
//        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
//
//        return Venue(title: title, locationName: locationName, coordinate: coordinate)
//    }
//
//    func mapItem() -> MKMapItem
//    {
//        let addressDictionary = [String(kABPersonAddressStreetKey) : subtitle]
//        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
//        let mapItem = MKMapItem(placemark: placemark)
//
//        mapItem.name = "\(title) \(subtitle)"
//
//        return mapItem
//    }
//}
//
//
