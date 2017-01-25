//
//  APIRequest.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-24.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import Foundation
import Alamofire

protocol APIRequest
{
    var path: String { get }
    var method: HTTPMethod { get }
    
    func parameters() -> Parameters?
    func headers() -> [String: String]?
}

extension APIRequest
{
    func parameters() -> Parameters?
    {
        return nil
    }
    
    func headers() -> [String: String]?
    {
        return nil
    }
}
