//
//  CovidDetailTableViewController.swift
//  COVID19
//
//  Created by SeongHoon Kim on 2021/12/06.
//

import UIKit

class CovidDetailTableViewController: UITableViewController {

    @IBOutlet weak var newCaseCell: UITableViewCell!
    
    @IBOutlet weak var totalCaseCell: UITableViewCell!
    @IBOutlet weak var recoveredCell: UITableViewCell!
    @IBOutlet weak var deathCell: UITableViewCell!
    @IBOutlet weak var percentageCell: UITableViewCell!
    @IBOutlet weak var overseasInflowCell: UITableViewCell!
    @IBOutlet weak var regionalOutbreakCell: UITableViewCell!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}
