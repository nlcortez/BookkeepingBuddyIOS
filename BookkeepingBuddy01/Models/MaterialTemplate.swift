//
//  MaterialTemplate.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 3/7/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

import Foundation

class MaterialTemplate : Codable {
    
    var category: MaterialCategory
    var name: String
    var measured_quantity: Int
    var cost: Double
    
    private enum CodingKeys: String, CodingKey {
        case category
        case name
        case measured_quantity
        case cost
    }
    
    init(category: MaterialCategory, name: String, measured_quantity: Int, cost: Double) {
        self.category = category
        self.name = name
        self.measured_quantity = measured_quantity
        self.cost = cost
    }
    
    func toAnyObject() -> Any {
        return [
            "category" : category.name,
            "name" : name,
            "measured_quantity" : measured_quantity,
            "cost" : cost
        ]
    }
    
}

