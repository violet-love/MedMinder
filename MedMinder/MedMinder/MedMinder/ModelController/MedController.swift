//
//  MedController.swift
//  MedsForNoodles
//
//  Created by Violet Lavender Love on 4/27/20.
//  Copyright © 2020 Love. All rights reserved.
//

import Foundation

class MedController {
    
    init() {
        
        loadFromPersistentStore()
        
    }
    
    var meds: [Med] = []
    func makeMed(name: String) -> Med {
        
        
        let med = Med(name: name)
        
        meds.append(med)
        
        saveToPersistentStore()
        
        return med
        
        
    }
    
    
    // MARK: - Persistence
    
    var persistentFileURL: URL? {
        
        let fileManager = FileManager.default
        
        let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let medsURL = documentsDir?.appendingPathComponent("meds.plist")
        
        return medsURL
    }
    
    func saveToPersistentStore() {
        
        do {
            
            let encoder = PropertyListEncoder()
            
           
            let medsPlist = try encoder.encode(meds)
            
      
            guard let persistentFileURL = persistentFileURL else {
                return
            }
            
            try medsPlist.write(to: persistentFileURL)
            
            
        } catch {
          
            print("things broke while trying to save meds:\(error)")
            
        }
        
    }
    func loadFromPersistentStore() {
        
        guard let persistentFileURL = persistentFileURL else {
            return
        }
        do {
            
            let decoder = PropertyListDecoder()
            
          
            let medsPlist = try Data(contentsOf: persistentFileURL)
            
            
            let meds = try decoder.decode([Med].self, from: medsPlist)
            
            self.meds = meds
        } catch {
            print("Error loading meds from plist: \(error)")
        }
        
    }
}

