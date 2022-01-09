//
//  BeerListViewController.swift
//  brewery
//
//  Created by SeongHoon Kim on 2022/01/09.
//

import UIKit


class BeerListViewController: UITableViewController {
    
    var beerList = [Beer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UINavigationBar
        title = "브루어리들"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //UITableView 설정
        tableView.register(BeerListCell.self, forCellReuseIdentifier: "BeerListCell")
        tableView.rowHeight = 150
        
        
    }
    
    
}

extension BeerListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListCell", for: indexPath) as! BeerListCell

        //guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListCell", for: indexPath) as? BeerListCell else { return UITableViewCell() }
        let beer = beerList[indexPath.row]
        cell.configure(with: beer)
        
        return cell
        
    }
}
