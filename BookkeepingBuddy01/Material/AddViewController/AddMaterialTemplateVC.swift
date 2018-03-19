//
//  AddMaterialTemplateVC.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 3/18/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

import UIKit
import Firebase
import Foundation
class AddMaterialTemplateVC : UITableViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var quantity: UITextField!
    @IBOutlet weak var cost: UITextField!
    @IBOutlet weak var listLabel: UILabel!
    
    var category: MaterialCategory?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func unwindToAddTemplate(_ segue: UIStoryboardSegue) {
    }
}
