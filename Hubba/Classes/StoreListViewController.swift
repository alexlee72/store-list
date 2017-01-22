//
//  StoreListViewController.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-21.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import UIKit

class StoreListViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    var stores = [Store]()
    let cellIdentifier = "StoreCell"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupUI()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Private
    private func setupUI()
    {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        stores.append(Store(id: "1", name: "Store 1"))
        stores.append(Store(id: "1", name: "Store 2"))
        stores.append(Store(id: "1", name: "Store 3"))

    }
}

extension StoreListViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let store = stores[indexPath.row]
        cell.textLabel?.text = store.name
        
        return cell
    }
}
