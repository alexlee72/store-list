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
        cities.append(City(displayName: "Ajax", searchName: "ajax"))
        cities.append(City(displayName: "Barrie", searchName: "barrie"))
        cities.append(City(displayName: "Collingwood", searchName: "collingwood"))
        cities.append(City(displayName: "Missisauga", searchName: "missisauga"))
        cities.append(City(displayName: "Toronto", searchName: "toronto"))
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
