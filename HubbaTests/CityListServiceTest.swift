//
//  HubbaTests.swift
//  HubbaTests
//
//  Created by Alex Lee on 2017-01-21.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import XCTest
@testable import Hubba

class CityListServiceTest: XCTestCase {
    var cityService: CityListService!
    var cities = [City]()
    
    override func setUp() {
        super.setUp()
        
        cityService = CityListService()
        
        cities.append(City(displayName: "Toronto", searchName: "toronto"))
        cities.append(City(displayName: "Ajax", searchName: "ajax"))
    }
    
    func testFetchData () {
        cityService.fetchData()
        
        XCTAssertTrue(cityService.cities.count > 0)
    }
    
    func testNumberOfItems() {
        cityService.cities = cities
        let count = cityService.numberOfItems()
        
        XCTAssertTrue(count == 2)
    }
    
    func testItemAtIndex() {
        cityService.cities = cities
        let cityFromService = cityService.item(at: 1)
        let cityFromList = cities[1]
        
        XCTAssertTrue(cityFromService.displayName == cityFromList.displayName)
    }
}
