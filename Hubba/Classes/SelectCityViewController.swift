//
//  SelectCityViewController.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-21.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import UIKit

protocol SelectCityDelegate: class
{
    func didSelectCity(_ cityId: String)
}

class SelectCityViewController: UIViewController
{
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    fileprivate let cellIdentifier = "cityCell"
    fileprivate var selectedCityId: String?
    weak var delegate: SelectCityDelegate?
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
    
    @IBAction func cancelButtonTapped(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func doneButtonTapped(_ sender: Any)
    {
        //TODO - pass selected city's id to store list view controller
        dismiss(animated: true, completion: {
            self.delegate?.didSelectCity(self.selectedCityId!)
        })
    }
}

//MARK: - UITableViewDataSource
extension SelectCityViewController: UITableViewDataSource
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
extension SelectCityViewController: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        let city = cities[indexPath.row]
        selectedCityId = city.cityId
        
        doneButton.isEnabled = true
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)
    {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}
