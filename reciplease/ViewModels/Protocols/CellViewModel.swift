//
//  CellViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation


// protocol cellvm
@objc protocol CellViewModel {
    // each cellvm have a nibName, reuseidentifier for cell and routing entry for push others controllers
    var nibName: String? { get set }
    var reuseIdentifier: String { get set }
    var indexPath: IndexPath? { get set }
    var routingEntry: RoutingEntry? { get set }

}

protocol TableCellViewModel: CellViewModel {
    var height: Float { get }

}

protocol TableEditedCellViewModel: TableCellViewModel {
    // Favorite cellviewmodel the user can delete one from the favorite with completionedit function
    var canEdit : Bool { get }
    func completionEdit(callback: @escaping (Error?) -> ())
}
