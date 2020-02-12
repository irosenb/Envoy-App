//
//  CoffeeShop.swift
//  Envoy-App
//
//  Created by Isaac Rosenberg on 2/11/20.
//  Copyright © 2020 Isaac Rosenberg. All rights reserved.
//

import UIKit

class CoffeeShop {
    var id: String?
    var address: String?
    var rating: String?
    var name: String?
    var photoUrl: String?
    
    func updateFromDictionary(_ dictionary: [String : Any]) {
        name = dictionary["name"] as? String
        let location = dictionary["location"] as? [String: Any]
        address = location?["address"] as? String
        rating = dictionary["rating"] as? String
        id = dictionary["id"] as? String
    }
}
