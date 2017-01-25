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
    struct Store: APIRequest
    {
        var path = "http://lcboapi.com/stores/500"
        var method = HTTPMethod.get
    }
}
