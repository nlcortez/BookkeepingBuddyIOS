//
//  MaterialAddVC.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 3/18/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

import UIKit
import Firebase
import Foundation

class MaterialAddVC: UIViewController {
    var databaseRef : DatabaseReference = Database.database().reference()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tabs: UISegmentedControl!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var templateView: UIView!
    @IBOutlet weak var inventoryView: UIView!
    var addMaterialCategoryVC: AddMaterialCategoryVC?
    var addMaterialTemplateVC: AddMaterialTemplateVC?
    var addMaterialVC: AddMaterialVC?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryView.isHidden = false
        templateView.isHidden = true
        inventoryView.isHidden = true
    }

    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        switch tabs.selectedSegmentIndex {
        case 0:
            categoryView.isHidden = false
            templateView.isHidden = true
            inventoryView.isHidden = true
        case 1:
            categoryView.isHidden = true
            templateView.isHidden = false
            inventoryView.isHidden = true
        case 2:
            categoryView.isHidden = true
            templateView.isHidden = true
            inventoryView.isHidden = false
        default:
            break;
        }
    }
    
    @IBAction func saveItem(_ sender: Any) {
        print("SAAVING")
        switch tabs.selectedSegmentIndex {
        case 0:
            let key = databaseRef.child("MaterialCategories").childByAutoId().key
            let cat = MaterialCategory(name: (addMaterialCategoryVC?.name.text)!, unit: (addMaterialCategoryVC?.unit.text)!).toAnyObject()
            databaseRef.child("MaterialCategories").child(key).setValue(cat)
            break;
        case 1:
            let key = databaseRef.child("MaterialTemplates").childByAutoId().key
            let template = MaterialTemplate(category: appDelegate.materialCategories["-L7vtpokzedBhsDJUOcP"]!,
                                            name: (addMaterialTemplateVC?.name.text)!,
                                            measured_quantity: (addMaterialTemplateVC!.quantity.text! as NSString).integerValue,
                                            cost: (addMaterialTemplateVC!.cost.text! as NSString).doubleValue).toAnyObject()
            
            databaseRef.child("MaterialTemplates").child(key).setValue(template)
            break;
        case 2:
            print("this is for adding materials to db")
            break;
        default:
            break;
        }
        performSegue(withIdentifier: "unwindToMaterialTabVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        let destination = segue.destination
        if(segue.identifier == "addCategory") {
            addMaterialCategoryVC = destination as? AddMaterialCategoryVC
        }
        else if(segue.identifier == "addTemplate") {
            addMaterialTemplateVC = destination as? AddMaterialTemplateVC
        }
        else if(segue.identifier == "addMaterial") {
            addMaterialVC = destination as? AddMaterialVC
        }
    }

}
