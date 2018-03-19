//
//  Material.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 3/7/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

import UIKit
import Foundation
import FirebaseDatabase

class Material : Codable {
    
    var id : String
    var template : MaterialTemplate
    var attribute : String
    var running_total : Int
    var quantity_remaining : Int
    
    private enum CodingKeys: String, CodingKey {
        case id
        case template
        case attribute
        case running_total
        case quantity_remaining
    }
    
    init(id: String, template : MaterialTemplate, attribute: String) {
        self.id = id
        self.template = template
        self.attribute = attribute
        self.running_total = template.measured_quantity
        self.quantity_remaining = template.measured_quantity
    }

    init(snapshot: DataSnapshot) {
        let snapvalues = snapshot.value as! [String : AnyObject]
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        id = snapvalues["id"] as! String
        template = appDelegate.materialTemplates[snapvalues["templateId"] as! String]!
        attribute = snapvalues["attribute"] as! String
        running_total = snapvalues["running_total"] as! Int
        quantity_remaining = snapvalues["quantity_remaining"] as! Int
    }
    
    func toAnyObject() -> Any {
        return [
            "id" : id,
            "template" : template.id,
            "attribute" : attribute,
            "running_total" : running_total,
            "quantity_remaining" : quantity_remaining
        ]
    }
    
}

