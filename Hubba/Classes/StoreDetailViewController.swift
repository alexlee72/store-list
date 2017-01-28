//
//  StoreDetailViewController.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-21.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import UIKit

enum StoreDetailInfo: Int
{
    case address
    case city
    case postalCode
    case telephone
    case productCount
    case inventoryCount

    static func count() -> Int
    {
        return 6
    }
}

class StoreDetailViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    fileprivate let cellIdentifier = "StoreDetailCell"
    var store: Store!
    fileprivate var service: StoreDetailService!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupService()
        service.fetchData(with: store.id!)
        setupUI()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Private
    private func setupUI()
    {
        navigationItem.title = store.name
        tableView.tableFooterView = UIView()
    }
    
    private func setupService()
    {
        service = StoreDetailService()
        service.delegate = self
    }

}

extension StoreDetailViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return service.storeDetail == nil ? 0 : StoreDetailInfo.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! StoreDetailCell
        let storeDetail = StoreDetailInfo(rawValue: indexPath.row)!
        var cellData: (key: String, value: String) = ("", "")
        
        switch storeDetail
        {
        case .address:
            cellData = ("Address", service.address())
        case .telephone:
            cellData = ("Telephone", service.telephone())
        case .city:
            cellData = ("City", service.city())
        case .postalCode:
            cellData = ("Postal Code", service.postalCode())
        case .productCount:
            cellData = ("Product Count", service.productCount())
        case .inventoryCount:
            cellData = ("Inventory Count", service.inventoryCount())
        }
        
        cell.keyLabel.text = cellData.key
        cell.valueLabel.text = cellData.value
        
        return cell
    }
}

extension StoreDetailViewController: StoreDetailDelegate
{
    func didFinishFetchingData()
    {
        self.tableView.reloadData()
    }
}
