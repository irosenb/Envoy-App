//
//  CoffeeShop.swift
//  Envoy-App
//
//  Created by Isaac Rosenberg on 2/11/20.
//  Copyright © 2020 Isaac Rosenberg. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class CoffeeShop {
    var id: String?
    var address: String?
    var rating: String?
    var name: String?
    var photoUrl: String?
    static let location = "410 Townsend Street, San Francisco, CA"
    
    func updateFromDictionary(_ dictionary: [String : Any]) {
        name = dictionary["name"] as? String
        let location = dictionary["location"] as? [String: Any]
        address = location?["address"] as? String
        rating = dictionary["rating"] as? String
        id = dictionary["id"] as? String
        
        let photos = dictionary["photos"] as? [String: Any]
        let groups = photos?["groups"] as? [[String: Any]]
        let firstGroup = groups?.first
        let items = firstGroup?["items"] as? [[String: Any]]
        let photo = items?.first
        
        if let photoSuffix = photo?["suffix"] as? String, let photoPrefix = photo?["prefix"] as? String {
            photoUrl = "\(photoPrefix.dropLast())\(photoSuffix)"
        }
        
        
    }
    
    static func fetch(id: String, completionHandler: @escaping (_ response: CoffeeShop?) -> Void) {
        let url = "https://api.foursquare.com/v2/venues/\(id)?client_id=NQTZHZWAZTYN1H1FBNGZEZJJBD0ZB1KDI5JO20PM0XNIPEPV&client_secret=BB52RWLB5UILXUHPSLSC4R4KS4F25VY244YPGT0KARPVDKGP&v=20200211"
        
        AF.request(url).responseJSON { (responseJSON) in
            guard let data = responseJSON.value as? [String: Any] else {
                print("Didn't work")
                return
            }
            
            guard let response = data["response"] as? [String: Any] else { return }
            guard let venue = response["venue"] as? [String: Any] else { return }
            
            let coffeeShop = CoffeeShop()
            coffeeShop.updateFromDictionary(venue)
            completionHandler(coffeeShop)
        }
    }
    
    static func fetchAll(completionHandler: @escaping (_ response: [CoffeeShop]?) -> Void) {
        // First we geocode address into coordinates. Wasn't able to input an address into the request.
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) in
            let placemark = placemarks?.first
            guard let lat = placemark?.location?.coordinate.latitude else { return }
            guard let lng = placemark?.location?.coordinate.longitude else { return }
            
            // Then we make the request
            let url = "https://api.foursquare.com/v2/venues/search?ll=\(lat),\(lng)&query=coffee&limit=15&radius=805&client_id=NQTZHZWAZTYN1H1FBNGZEZJJBD0ZB1KDI5JO20PM0XNIPEPV&client_secret=BB52RWLB5UILXUHPSLSC4R4KS4F25VY244YPGT0KARPVDKGP&v=20200211"
            AF.request(url).responseJSON { (responseJSON) in
                guard let data = responseJSON.value as? [String: Any] else {
                    print("Didn't work")
                    return
                }
                
                guard let response = data["response"] as? [String: Any] else { return }
                guard let venues = response["venues"] as? [[String: Any]] else { return }
                
                var coffeeShops = [CoffeeShop]()
                
                for venue in venues {
                    let coffeeShop = CoffeeShop()
                    coffeeShop.updateFromDictionary(venue)
                    
                    coffeeShops.append(coffeeShop)
                }
                
                completionHandler(coffeeShops)
            }
        }
    }
}
