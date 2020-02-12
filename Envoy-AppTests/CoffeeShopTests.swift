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
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoffeeShopsNotNil() {
        Envoy_App.CoffeeShop.fetch { (shops) in
            XCTAssertNotNil(shops)
        }
    }
    
    func testCoffeeShopsCount() {
        Envoy_App.CoffeeShop.fetch { (shops) in
            XCTAssertTrue(shops?.count == self.shopCount)
        }
    }
    
    func testCoffeeShopsFirstShop() {
        Envoy_App.CoffeeShop.fetch { (shops) in
            XCTAssertTrue(shops?.first?.name == "Philz Coffee")
        }
    }
}
