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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            medController.meds.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
//            let appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
//                       let context:NSManagedObjectContext = appDel.managedObjectContext!
//                       context.deleteObject(medController.meds[indexPath.row] as NSManagedObject)
//            medController.meds.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
            print(medController.meds)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
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


