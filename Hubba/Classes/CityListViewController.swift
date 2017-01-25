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
    fileprivate lazy var cities: [City] = {
        var cities = [City]()
        cities.append(City(name: "Toronto", cityId: "1"))
        cities.append(City(name: "Ajax", cityId: "2"))
            
        return cities
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
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
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let city = cities[indexPath.row]
        cell.textLabel?.text = city.name
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension CityListViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        let city = cities[indexPath.row]
        selectedCityId = city.cityId
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
