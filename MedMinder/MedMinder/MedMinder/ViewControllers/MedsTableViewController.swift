//
//  MedTableViewController.swift
//  MedsForNoodles
//
//  Created by Violet Lavender Love on 4/28/20.
//  Copyright © 2020 Love. All rights reserved.
//

import UIKit

class MedsTableViewController: UITableViewController {
    
    
    var medController = MedController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return medController.meds.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "medCell", for: indexPath) as? MedTableViewCell else { fatalError("Cell identifier is wrong OR the cell is not of type MedTableViewCell") }
        
        let med = medController.meds[indexPath.row]
        
        cell.nameLabel.text = med.name
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    @IBAction func addMed(_ sender: Any) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showAddMed" {
            guard let addMedVC = segue.destination as? AddMedViewController else { return }
            
            addMedVC.delegate = self
        }
        
        
    }
}
extension MedsTableViewController: AddMedDelegate {
    func addMed(med: Med) {
        
        medController.makeMed(name: med.name)
        
        print(medController.meds)
        
        tableView.reloadData()
        
    }
}


