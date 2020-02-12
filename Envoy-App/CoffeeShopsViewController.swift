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
    var coffeeShops = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        view.addSubview(tableView)
        
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 0).isActive = true
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
        
    }
    
}
