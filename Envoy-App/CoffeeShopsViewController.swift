//
//  CoffeeShopsViewController.swift
//  Envoy-App
//
//  Created by Isaac Rosenberg on 2/11/20.
//  Copyright © 2020 Isaac Rosenberg. All rights reserved.
//

import UIKit

class CoffeeShopsViewController: UIViewController {
    let tableView = UITableView()
    var coffeeShops = [CoffeeShop]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Coffee Shops"
        
        setupTableView()
        fetchData()
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(CoffeeShopTableViewCell.self, forCellReuseIdentifier: "CoffeeShopTableViewCell")
        view.addSubview(tableView)
        
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0).isActive = true
    }
    
    func fetchData() {
        CoffeeShop.fetchAll { (shops) in
            guard let shops = shops else { return }
            self.coffeeShops = shops
            
            for (index, shop) in self.coffeeShops.enumerated() {
                // Fetch photos for each shop since they're not included in /venues/search
                guard let shopId = shop.id else { return }
                CoffeeShop.fetch(id: shopId) { (coffeeShop) in
                    guard let coffeeShop = coffeeShop else { return }
                    self.coffeeShops[index] = coffeeShop
                }
            }
            
            self.tableView.reloadData()
        }
    }
}

extension CoffeeShopsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeShops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeShopTableViewCell", for: indexPath) as? CoffeeShopTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        
        let shop = coffeeShops[indexPath.row]
        
        cell.addressLabel.text = shop.address
        cell.nameLabel.text = shop.name
        
        cell.photoView.image = nil
        if let photoUrl = shop.photoUrl {
            cell.photoView.sd_setImage(with: URL(string: photoUrl), completed: nil)
        }
        
        if let rating = shop.rating {
            cell.ratingLabel.text = String(format:"%.1f", rating)
        }
        
        return cell
    }
}

extension CoffeeShopsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = CoffeeShopDetailViewController()
        detail.coffeeShop = coffeeShops[indexPath.row]
        
        navigationController?.pushViewController(detail, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 228
    }
}
