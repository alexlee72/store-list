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
