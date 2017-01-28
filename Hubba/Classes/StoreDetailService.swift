//
//  StoreDetailService.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-21.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import UIKit

protocol StoreDetailDelegate: class
{
    func didFinishFetchingData()
}

class StoreDetailService: NSObject
{
    private var store: Store?
    var storeDetail: StoreDetail?
    weak var delegate: StoreDetailDelegate?
    
    //MARK: - Public
    func fetchData(with storeID: Int)
    {
        let request = Request.StoreInfo(storeID: storeID)
        NetworkManager.shared.execute(request, success: { response in
            print(response ?? "No response")
            if let response = response as? [String: Any], let result = response["result"] as? [String: Any]
            {
                self.storeDetail = request.transforming(fromDictionary: result)
            }
            
            self.delegate?.didFinishFetchingData()
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func address() -> String
    {
        return storeDetail?.address1 ?? ""
    }
    
    func telephone() -> String
    {
        return storeDetail?.telephone ?? ""
    }
    
    func city() -> String
    {
        return storeDetail?.city ?? ""
    }
    
    func postalCode() -> String
    {
        return storeDetail?.postalCode ?? ""
    }
    
    func productCount() -> String
    {
        if let count = storeDetail?.productCount
        {
            return String(count)
        }

        return "N/A"
    }
    
    func inventoryCount() -> String
    {
        if let count = storeDetail?.inventoryCount
        {
            return String(count)
        }
        
        return "N/A"
    }
}


