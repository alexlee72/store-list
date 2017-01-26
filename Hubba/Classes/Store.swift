//
//  Store.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-21.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import UIKit

struct Store
{
    let id: Int
    let name: String
    let address1: String
    let telephone: String
    
    init(with data: [String: Any])
    {
        id = data["id"] as! Int? ?? 0
        name = data["name"] as! String? ?? ""
        address1 = data["address_line_1"] as! String? ?? ""
        telephone = data["telephone"] as! String? ?? ""
    }
}
