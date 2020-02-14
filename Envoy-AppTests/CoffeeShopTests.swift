//
//  CoffeeShopTests.swift
//  Envoy-AppTests
//
//  Created by Isaac Rosenberg on 2/12/20.
//  Copyright © 2020 Isaac Rosenberg. All rights reserved.
//

import XCTest
@testable import Envoy_App

class CoffeeShopTests: XCTestCase {
    let shopCount = 15
    var firstId: String?
    
    override func setUp() {
        Envoy_App.CoffeeShop.fetchAll { (shops) in
            self.firstId = shops?.first?.id
        }
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoffeeShopsNotNil() {
        Envoy_App.CoffeeShop.fetchAll { (shops) in
            XCTAssertNotNil(shops)
        }
    }
    
    func testCoffeeShopsCount() {
        Envoy_App.CoffeeShop.fetchAll { (shops) in
            XCTAssertTrue(shops?.count == self.shopCount)
        }
    }
    
    func testCoffeeShopHasName() {
        Envoy_App.CoffeeShop.fetchAll { (shops) in
            XCTAssertTrue(shops?.first?.name == "Philz Coffee")
        }
    }
    
    func testCoffeeShopHasAddress() {
        Envoy_App.CoffeeShop.fetchAll { (shops) in
            XCTAssertTrue(shops?.first?.address == "201 Berry Street")
        }
    }
    
    func testCoffeeShopHasImageUrl() {
        if let firstId = self.firstId {
            Envoy_App.CoffeeShop.fetch(id: firstId) { (shop) in
                XCTAssertNotNil(shop?.photoUrl)
            }
        }
    }
    
    func testCoffeeShopHasRating() {
        if let firstId = self.firstId {
            Envoy_App.CoffeeShop.fetch(id: firstId) { (shop) in
                XCTAssertTrue(shop?.rating == 8.8)
            }
        }
    }
}
