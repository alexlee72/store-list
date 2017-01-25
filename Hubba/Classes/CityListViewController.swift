//
//  SelectCityViewController.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-21.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import UIKit

class CityListViewController: UIViewController
{
    @IBOutlet private weak var tableView: UITableView!
    fileprivate let cellIdentifier = "cityCell"
    fileprivate var selectedCityId: String?
    fileprivate var service = CityListService()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        service.fetchData()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

//MARK: - UITableViewDataSource
extension CityListViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return service.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let city = service.item(at: indexPath.row)
        cell.textLabel?.text = city.displayName
        
        return cell
    }
}

