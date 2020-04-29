//
//  Med.swift
//  MedsForNoodles
//
//  Created by Violet Lavender Love on 4/27/20.
//  Copyright © 2020 Love. All rights reserved.
//

import Foundation

struct Med: Encodable, Decodable {
    
    var name: String
   
    
    init(name: String) {
        
        self.name = name
        
    }
    
}
