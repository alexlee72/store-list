//
//  Request+Store.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-25.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import Foundation
import Alamofire

struct Request
{
    static let baseURL = "http://lcboapi.com"
    
    struct StoreList: APIRequest
    {
        let path = "/stores"
        let method = HTTPMethod.get
        var searchText: String
        
        func parameters() -> Parameters?
        {
            return ["geo": searchText]
        }
    }
}
