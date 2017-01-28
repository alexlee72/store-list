//
//  StoreListService.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-21.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import UIKit

protocol StoreListDelegate: class
{
    func didFinishFetchingData()
}

class StoreListService: NSObject
{
    private var stores = [Store]()
    weak var delegate: StoreListDelegate?
    
    //MARK: - Public
    func fetchData(with cityName: String)
    {
        stores.removeAll()

        let request = Request.StoreList(searchText: cityName)
        
        NetworkManager.shared.execute(request, success: { response in
            if let response = response as? [String: Any], let result = response["result"] as? [[String: Any]]
            {
                self.stores = request.transforming(fromArray: result)
            }
            
            self.delegate?.didFinishFetchingData()
        }, failure: { error in
            print(error.localizedDescription)
        })
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
