//
//  SelectCityService.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-21.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import UIKit

class CityListService: NSObject
{
    var cities = [City]()
    
    func fetchData()
    {
        let dataSource: [(displayName: String, searchName: String)] = [("Ajax", "ajax"),
                                                                       ("Barrie", "Barrie"),
                                                                       ("Collingwood", "Collingwood"),
                                                                       ("Missisauga", "Missisauga"),
                                                                       ("Toronto", "Toronto")]
        
        dataSource.forEach { displayName, searchName in
            self.cities.append(City(displayName: displayName, searchName: searchName))
        }
    }
    
    func numberOfItems() -> Int
    {
        return cities.count
    }
    
    func item(at index: Int) -> City
    {
        return cities[index]
    }
}
