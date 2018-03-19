//
//  AppDelegate.swift
//  BookkeepingBuddy01
//
//  Created by Natasha Cortez on 2/1/18.
//  Copyright © 2018 Natasha Cortez. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var databaseRef : DatabaseReference?
    var materialCategories: [String: MaterialCategory] = [:]
    var materialTemplates : [String: MaterialTemplate] = [:]


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        Database.database().isPersistenceEnabled = true
        databaseRef = Database.database().reference()
        
        //initialize material categories
        initMaterialCategoriesData()
        initMaterialTemplatesData()
        
        return true
    }
    
    func initMaterialTemplatesData() {
        databaseRef!.child("MaterialTemplates").observeSingleEvent(of: .value, with: { snapshot in
            
            var newTemplates : [String: MaterialTemplate] = [:]
            
            for item in snapshot.children {
                let curItem = item as! DataSnapshot
                newTemplates[curItem.key] = MaterialTemplate(snapshot: curItem)
                print("adding!")
            }
            self.materialTemplates = newTemplates
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    
    func initMaterialCategoriesData() {
        databaseRef!.child("MaterialCategories").observeSingleEvent(of: .value, with: { snapshot in
            
            var newCategories : [String: MaterialCategory] = [:]
            
            for item in snapshot.children {
                let curItem = item as! DataSnapshot
                newCategories[curItem.key] = MaterialCategory(snapshot: curItem)
            }
            self.materialCategories = newCategories
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

