//
//  MaterialTabViewController.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 3/7/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

import UIKit
import Firebase
import Foundation

class MaterialTabViewController : UIViewController {
    @IBOutlet weak var tabs: UISegmentedControl!
    @IBOutlet weak var overviewView: UIView!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var templateView: UIView!
    @IBOutlet weak var inventoryView: UIView!
    @IBOutlet weak var addButton: UIBarButtonItem!

    var databaseRef : DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overviewView.isHidden = false
        categoryView.isHidden = true
        templateView.isHidden = true
        inventoryView.isHidden = true
    }
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch tabs.selectedSegmentIndex {
        case 0:
            overviewView.isHidden = false
            categoryView.isHidden = true
            templateView.isHidden = true
            inventoryView.isHidden = true
        case 1:
            overviewView.isHidden = true
            categoryView.isHidden = false
            templateView.isHidden = true
            inventoryView.isHidden = true
        case 2:
            overviewView.isHidden = true
            categoryView.isHidden = true
            templateView.isHidden = false
            inventoryView.isHidden = true
        case 3:
            overviewView.isHidden = true
            categoryView.isHidden = true
            templateView.isHidden = true
            inventoryView.isHidden = false
        default:
            break;
        }
    }

    @IBAction func cancelToMaterialTabViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func saveMaterial(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let destination = segue.destination
        if (segue.identifier == "addMaterialSegue") {
            let destVC = destination as? MaterialAddVC
            //let mat = Material(color: colorTextField.text!, name: nameTextField.text!, amount: Int(amountTextField.text!)!, unit: unitTextField.text!)
            
            //destVC?.insertNewMaterial(newMaterial: mat)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
