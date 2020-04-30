//
//  AddMedViewController.swift
//  MedsForNoodles
//
//  Created by Violet Lavender Love on 4/28/20.
//  Copyright © 2020 Love. All rights reserved.
//

import UIKit

protocol AddMedDelegate {
    
    func addMed(med: Med)
    
}

class AddMedViewController: UIViewController {
    
    
    @IBOutlet var nameTextField: UITextField!
    
    var delegate: AddMedDelegate?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    
    @IBAction func Save(_ sender: Any) {
        guard let name = nameTextField.text,
            !name.isEmpty,
        let delegate = delegate else  { return }
        let med = Med(name: name)
        delegate.addMed(med: med)
        navigationController?.popViewController(animated: true)
        print("save button tapped")
    }
}

