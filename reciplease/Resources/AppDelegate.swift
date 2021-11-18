//
//  AppDelegate.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import UIKit
import CoreData


@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
  
        UINavigationBar.appearance().tintColor = UIColor.systemBackground
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font : (UIFont(name: "Avenir Next", size: 25))!, NSAttributedString.Key.foregroundColor: UIColor.secondaryLabel]
//        removeCoreData()

        return true
        
    }
   
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "reciplease")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy

        })
        return container
    }()
    
    static var persistentContainer: NSPersistentContainer {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    }

    static var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

}

