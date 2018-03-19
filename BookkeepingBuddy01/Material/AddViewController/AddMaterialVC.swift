//
//  AddMaterialVC.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 3/18/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

import UIKit
import Firebase
import Foundation
class AddMaterialVC : UITableViewController {
    //template picker
    @IBOutlet weak var attribute: UITextField!
    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var quantityMeasured: UILabel!
    @IBOutlet weak var quantityRemaining: UILabel!
    //image picker

    var template: MaterialTemplate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func unwindToAddMaterial(_ segue: UIStoryboardSegue) {
    }
}
