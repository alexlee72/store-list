//
//  StoreListService.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-21.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import UIKit

class StoreListService: NSObject
{
    private var stores = [Store]()

    
    //MARK: - Public
    func loadStores()
    {
        stores.append(Store(id: "1", name: "Store 1"))
        stores.append(Store(id: "1", name: "Store 2"))
        stores.append(Store(id: "1", name: "Store 3"))
    }
    
    func numberOfStores() -> Int
    {
        return stores.count
    }
    
    func store(at index: Int) -> Store
    {
        return stores[index]
    }
    
}
