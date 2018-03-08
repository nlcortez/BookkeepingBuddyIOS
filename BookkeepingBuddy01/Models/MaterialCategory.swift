//
//  MaterialCategory.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 2/1/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

import Foundation
import FirebaseDatabase

class MaterialCategory : Codable {
    
    var name: String
    var unit: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case unit
    }
    
    init(name: String, unit: String) {
        self.name = name
        self.unit = unit
    }
    
    init(snapshot: DataSnapshot) {
        name = snapshot.key
        let snapvalues = snapshot.value as! [String : AnyObject]
        unit = snapvalues["unit"] as! String
    }
    
    func toAnyObject() -> Any {
        return [
            "name" : name,
            "unit" : unit
        ]
    }
    
}


