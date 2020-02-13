//
//  CoffeeShopsTableViewCell.swift
//  Envoy-App
//
//  Created by Isaac Rosenberg on 2/11/20.
//  Copyright © 2020 Isaac Rosenberg. All rights reserved.
//

import UIKit

class CoffeeShopTableViewCell: UITableViewCell {
    let photoView = UIImageView()
    let nameLabel = UILabel()
    let addressLabel = UILabel()
    let ratingLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupPhotoView()
        setupNameLabel()
        setupAddressLabel()
        setupRatingLabel()
    }
    
    func setupPhotoView() {
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.contentMode = .scaleAspectFill
        photoView.layer.masksToBounds = true
        addSubview(photoView)
        
        photoView.heightAnchor.constraint(equalToConstant: 170).isActive = true
        photoView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        photoView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
    }
    
    func setupNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        addSubview(nameLabel)
        
        nameLabel.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 0).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 274).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    }
    
    func setupAddressLabel() {
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.font = .systemFont(ofSize: 24, weight: .regular)
        addSubview(addressLabel)
        
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0).isActive = true
        addressLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        addressLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    }
    
    func setupRatingLabel() {
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.font = .systemFont(ofSize: 24, weight: .regular)
        addSubview(ratingLabel)
        
        ratingLabel.topAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 0).isActive = true
        ratingLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
