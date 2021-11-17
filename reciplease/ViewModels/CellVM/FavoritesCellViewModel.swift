//
//  FavoritesCellViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 10/11/2021.
//

import Foundation
import CoreData
// MARK: - FavoriteCellViewModel

class FavoriteCellViewModel: TableEditedCellViewModel {
    // editable
    
    var canEdit = true
    
    var routingEntry: RoutingEntry?
    
    var height: Float {
        return 185
    }
    
    
    var indexPath: IndexPath?
    var nibName: String? = "FavoriteViewCell"
    lazy var reuseIdentifier: String = String(describing: self)
    
    // Recipes instance as recipeslistcellvm
    
    var name : String
    
    var secondName: [String]
    var image: URL?
    var duration : Float
    var numberOfPeople: Float
    
    init(name: String, secondName: [String], image: URL?, duration: Float, numberOfPeople: Float,  routingEntry : RoutingEntry) {
        self.name = name
        self.secondName = secondName
        self.image = image
        self.duration = duration
        self.numberOfPeople = numberOfPeople
        self.routingEntry = routingEntry
    }
    // if user edit it delete it from core data
    func completionEdit(callback: @escaping (Error?) -> ()) {
        // delete One record from core data by name
        let managedContext = AppDelegate.persistentContainer.viewContext
        // sort favorites by name
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"Favorite")
        fetchRequest.predicate = NSPredicate(format: "name = %@","\(name)")
        
        let fetchedResults =  try? managedContext.fetch(fetchRequest) as? [NSManagedObject]
        for entity in fetchedResults! {
            // delete object
            managedContext.delete(entity)
            do
            {// save context
                try managedContext.save()
            }
            catch
            { // callback with an alert if success
                callback(RecipeError.deletedFromFavorites)
                
            }
        }
        // nil if not succeed
        callback(nil)
        
    }
    
    
    
}
