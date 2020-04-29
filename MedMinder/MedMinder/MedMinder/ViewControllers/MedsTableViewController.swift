//
//  MedTableViewController.swift
//  MedsForNoodles
//
//  Created by Violet Lavender Love on 4/28/20.
//  Copyright © 2020 Love. All rights reserved.
//

import UIKit

class MedsTableViewController: UITableViewController {
    
    
    let medController = MedController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "medCell", for: indexPath)
    
     
     return cell
        
     }
    
}

