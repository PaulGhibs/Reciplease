//
//  Favorite.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 09/11/2021.
//

import Foundation
import CoreData

/// Core Data manager
class Favorite: NSManagedObject {
 


  
    // MARK: - Properties


    static var all: [Favorite] {
        let request: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        guard let favorites = try? AppDelegate.viewContext.fetch(request) else {
            return []
        }
      
        return favorites
    }

    

    
}


// MARK: - Delete  favorites

extension Favorite {
    /// Delete all stored recipes
    static func deleteAll(viewContext: NSManagedObjectContext = AppDelegate.viewContext) {
       
        
        let fetchRequest: NSFetchRequest<Favorite>
        fetchRequest = Favorite.fetchRequest()

        // Add a predicate for entities with a name
        // attribute equal to "Apple"
        fetchRequest.predicate = NSPredicate(
            format: "name LIKE %@", "Apple"
        )

        // Get a reference to a NSManagedObjectContext
        let context = viewContext

        // Perform the fetch request to get the objects
        // matching the predicate
        let objects = try! context.fetch(fetchRequest)

        // Handle multiple entity types
        for object in objects {
            if let object = object as? Favorite {
                print("name:", object.name)
            }
            else if let object = object as? Favorite {
                print("url:", object.name)
            }
        }
        
        let delete = NSBatchDeleteRequest(fetchRequest: Favorite.fetchRequest())
  
        do { try viewContext.execute(delete) }
        catch { print("unable to delete all stored objects: ", error) }
    }
    
   
 
    
}

