//
//  MedTableViewController.swift
//  MedsForNoodles
//
//  Created by Violet Lavender Love on 4/28/20.
//  Copyright © 2020 Love. All rights reserved.
//

import UIKit

class MedsTableViewController: UITableViewController {
    
    
    var meds: [Med] = [Med(name: "Aspirin")]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return meds.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "medCell", for: indexPath) as? MedTableViewCell else { fatalError("Cell identifier is wrong OR the cell is not of type MedTableViewCell") }
        
        let med = meds[indexPath.row]
        
        cell.nameLabel.text = med.name
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showAddMed" {
            let addMedVC = segue.destination as? AddMedViewController
            
            addMedVC?.delegate = self
        }
        
        
    }
}
extension MedsTableViewController: AddMedDelegate {
    func addMed(med: Med) {
        
        meds.append(med)
        
        tableView.reloadData()
        
    }
}


