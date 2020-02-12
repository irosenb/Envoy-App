//
//  CoffeeShopDetailViewController.swift
//  Envoy-App
//
//  Created by Isaac Rosenberg on 2/12/20.
//  Copyright © 2020 Isaac Rosenberg. All rights reserved.
//

import UIKit
import SDWebImage

class CoffeeShopDetailViewController: UIViewController {
    var coffeeShop: CoffeeShop?
    let image = UIImageView()
    let nameLabel = UILabel()
    let addressLabel = UILabel()
    let ratingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupImage()
        setupNameLabel()
        setupAddressLabel()
        setupRatingLabel()
        
        fetchShop()
    }
    
    func fetchShop() {
        guard let coffeeShopId = coffeeShop?.id else { return }
        
        CoffeeShop.fetch(id: coffeeShopId) { (shop) in
            guard let shop = shop else { return }
            
            if let photoUrl = shop.photoUrl {
                self.image.sd_setImage(with: URL(string: photoUrl), completed: nil)
            }
            
            self.nameLabel.text = shop.name
            self.addressLabel.text = shop.address
            
            if let rating = shop.rating {
                self.ratingLabel.text =  String(format:"%.1f", rating)
            }
            
        }
    }
    
    func setupImage() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        view.addSubview(image)
        
        image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        image.heightAnchor.constraint(equalToConstant: 170).isActive = true
        image.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
    }
    
    func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        view.addSubview(nameLabel)
       
        nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 0).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 274).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
   }
       
    func setupAddressLabel() {
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.font = .systemFont(ofSize: 24, weight: .regular)
        view.addSubview(addressLabel)
           
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        addressLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
       
    func setupRatingLabel() {
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font = .systemFont(ofSize: 24, weight: .regular)
        view.addSubview(ratingLabel)
           
        ratingLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 0).isActive = true
        ratingLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    }
    
}
