//
//  Favorite.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 09/11/2021.
//

import Foundation
import CoreData

// Core Data manager
class Favorite: NSManagedObject {
    
    // MARK: - Properties
    
    static var all: [Favorite] {
        let request: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        // sort result by name
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        // constraint for name in core data for deleting automatically duplicate
        let favorites = try! AppDelegate.viewContext.fetch(request)
        return favorites
        
    }
    
    
    
    
}

extension Favorite {
    // Delete all stored recipes
    static func deleteAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
        
        let delete = NSBatchDeleteRequest(fetchRequest: Favorite.fetchRequest())
        
        do { try viewContext.execute(delete) }
        catch { print("unable to delete all stored objects: ", error) }
    }
    
}

