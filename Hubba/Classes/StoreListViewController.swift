//
//  StoreListViewController.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-21.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import UIKit

/**
 stores by location
 http://lcboapi.com/stores?lat=43.6809&lon=-79.3339
 stores by search
 http://lcboapi.com/stores?geo=m4j4v7
 store detail
 http://lcboapi.com/stores/500
 */
class StoreListViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    fileprivate let cellIdentifier = "StoreCell"
    fileprivate let service = StoreListService()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        service.loadStores()
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
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
    }
}


//MARK: - UITableViewDataSource
extension StoreListViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return service.numberOfStores()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let store = service.store(at: indexPath.row)
        cell.textLabel?.text = store.name
        
        return cell
    }
}

extension StoreListViewController: UITableViewDelegate
{
    
}
