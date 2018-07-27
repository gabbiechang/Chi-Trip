//
//  NetworkManager.swift
//  Chi Trip
//
//  Created by Gabbie on 7/24/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

struct NetworkManager {
    
//    let topCities = ["Chicago", "San Francisco", "Los Angeles", "New York City", "Las Vegas", "Boston", "Washington", "Orlando", "Miami"]
//    
    let mapFilterCategories = ["Tourist Attractions", "Landmarks & Historical Buildings", "Outdoor Activities", "Museums"]
    
    
    
    
    static func getAttractions (city: String, filter: String, callback: @escaping ([Attraction]) -> Void ){
        
        let apiToContact = "https://api.yelp.com/v3/businesses/search?term=\(filter)&location=\(city)"
        let url = URL(string: apiToContact)
        
        var request = URLRequest(url: url!)
        request.setValue("Bearer h0qV778TvuJApBtfqotaaLzU253N0ig0fReQfF0FDI4esqyf3y2nMLQjKum6mw7NcAbKQynDhIEiUlcaY2ib13yDwAd2uiiKEyogJK8pjtF3RLyld2uCut9FGa1XW3Yx", forHTTPHeaderField: "Authorization")
        
        
        
        Alamofire.request(request).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let businesJson = json["businesses"].arrayValue
                    
                    var attractions = [Attraction]()
                    
                    businesJson.forEach({ (json) in
                        let attr = Attraction(json: json)
                        attractions.append(attr)
                    })
                    
                    DispatchQueue.main.async {
                        callback(attractions)
                    }
                 
                  
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
