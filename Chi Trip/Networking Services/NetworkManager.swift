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

    
    
    static func getAttractions(completionHandler: @escaping ([Attraction]) -> Void) {
        
//        let apiToContact = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=37.7749,-122.4194&radius=1500&type=point_of_interest&keyword=tourist_attraction&key=AIzaSyAh9_Ub7U3ySx5pJg5roU46TJJqab__qeM"
        let apiToContact = "https://api.yelp.com/v3/businesses/search?term=tourist_attractions&location=chicago,il"
        guard let url = URL(string: apiToContact) else {return assertionFailure("URL Failed")}
        
        var request = URLRequest(url: url)
        request.setValue("Bearer h0qV778TvuJApBtfqotaaLzU253N0ig0fReQfF0FDI4esqyf3y2nMLQjKum6mw7NcAbKQynDhIEiUlcaY2ib13yDwAd2uiiKEyogJK8pjtF3RLyld2uCut9FGa1XW3Yx", forHTTPHeaderField: "Authorization")

        var attractions = [Attraction]()
        
        Alamofire.request(request).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    
                    let json = JSON(value)
                    let businesJson = json["businesses"].arrayValue

                    
                    businesJson.forEach({ (json) in
                        let attr = Attraction(name: name, imageURL: imageURL, coordinate: coordinate)
                        attractions.append(attr)
                    })

                    DispatchQueue.main.async {
                        completionHandler(attractions)
                    }
                
                }
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
}
