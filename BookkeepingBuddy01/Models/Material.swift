//
//  Material.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 3/7/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

import Foundation

class Material : Codable {
    
    var template : MaterialTemplate
    var attribute : String
    var running_total : Int
    var quantity_remaining : Int
    
    private enum CodingKeys: String, CodingKey {
        case template
        case attribute
        case running_total
        case quantity_remaining
    }
    
    init(template : MaterialTemplate, attribute: String) {
        self.template = template
        self.attribute = attribute
        self.running_total = template.measured_quantity
        self.quantity_remaining = template.measured_quantity
    }
    
    func toAnyObject() -> Any {
        return [
            "template" : template.name,
            "attribute" : attribute,
            "running_total" : running_total,
            "quantity_remaining" : quantity_remaining
        ]
    }
    
}

