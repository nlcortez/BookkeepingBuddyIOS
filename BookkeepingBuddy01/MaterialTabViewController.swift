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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
