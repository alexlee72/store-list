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
    @IBOutlet weak var spinnerView: UIActivityIndicatorView!
    var city: City!
    fileprivate let cellIdentifier = "StoreCell"
    fileprivate var service: StoreListService!
    fileprivate var selectedStore: Store?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupService()
        service.fetchData(with: city.searchName)
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool)
    {
        if let indexPath = tableView.indexPathForSelectedRow
        {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Private
    private func setupService()
    {
        service = StoreListService()
        service.delegate = self
    }
    
    private func setupUI()
    {
        navigationItem.title = city.displayName
        tableView.tableFooterView = UIView()
        spinnerView.activityIndicatorViewStyle = .whiteLarge
        spinnerView.color = UIColor.gray
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let viewController = segue.destination as! StoreDetailViewController
        viewController.store = selectedStore!
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
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! StoreCell
        let store = service.store(at: indexPath.row)
        cell.nameLabel.text = store.name
        cell.addressLabel.text = store.address1
        cell.telephoneLabel.text = store.telephone
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension StoreListViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        selectedStore = service.store(at: indexPath.row)
        
        return indexPath
    }
}

extension StoreListViewController: StoreListDelegate
{
    func didFinishFetchingData()
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.tableView.reloadData()
            self.spinnerView.stopAnimating()
        }
    }
}
