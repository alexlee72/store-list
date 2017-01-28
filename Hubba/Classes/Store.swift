//
//  Store.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-21.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import UIKit

protocol Deserializable
{
    init(with dictData: [String: Any])
}

struct Store: Deserializable
{
    var id: Int?
    var name: String?
    var address1: String?
    var telephone: String?
    
    init(with data: [String: Any])
    {
        id = data["id"] as? Int
        name = data["name"] as? String
        address1 = data["address_line_1"] as? String
        telephone = data["telephone"] as? String
    }
}

struct StoreDetail: Deserializable
{
    var name: String?
    var address1: String?
    var telephone: String?
    var city: String?
    var postalCode: String?
    var productCount: Int?
    var inventoryCount: Int?
    
    init(with data: [String: Any])
    {
        let store = Store(with: data)
        name = store.name
        address1 = store.address1
        telephone = store.telephone
        
        city = data["city"] as? String
        postalCode = data["postal_code"] as? String
        productCount = data["products_count"] as? Int
        inventoryCount = data["inventory_count"] as? Int
    }
}
