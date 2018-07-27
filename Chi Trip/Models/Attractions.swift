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
        print(json)
        self.name = json["name"].stringValue
       self.imageURL =  json["image_url"].stringValue
    //   self.description = json[""].stringValue //no description
        
    }
    
}
