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
    func transforming<T: Deserializable>(fromArray array: [[String: Any]]) -> [T]
    func transforming<T: Deserializable>(fromDictionary dict: [String: Any]) -> T
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

    func transforming<T: Deserializable>(fromArray array: [[String: Any]]) -> [T]
    {
        var items = [T]()
        for itemData in array
        {
            let item = T.init(with: itemData)
            items.append(item)
        }
        
        return items
    }
    
    func transforming<T: Deserializable>(fromDictionary dict: [String: Any]) -> T
    {
        let item = T.init(with: dict)
        
        return item
    }
}
