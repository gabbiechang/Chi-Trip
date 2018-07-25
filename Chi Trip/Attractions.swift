//
//  Attractions.swift
//  Chi Trip
//
//  Created by Gabbie on 7/24/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import SwiftyJSON


struct Attraction {
    let name: String
    let imageURL: String
   // let description: String
    
    
    init(json: JSON) {
        self.name = json["name"].stringValue
       self.imageURL =  json["image_url"].stringValue
       // self.description =
        
    }
    
}



//import Foundation
//import SwiftyJSON
//
//struct Movie {
//    let name: String
//    let rightsOwner: String
//    let price: Double
//    let link: String
//    let releaseDate: Strsing
//
//    init(json: JSON) {
//        self.name = json["im:name"]["label"].stringValue
//        self.rightsOwner = json["rights"]["label"].stringValue
//        self.price = json["im:price"]["attributes"]["amount"].doubleValue
//        self.link = json["link"][0]["attributes"]["href"].stringValue
//        self.releaseDate = json["im:releaseDate"]["attributes"]["label"].stringValue
//    }
//}
