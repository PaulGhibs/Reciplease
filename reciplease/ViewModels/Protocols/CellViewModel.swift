//
//  CellViewModel.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation

@objc protocol CellViewModel {
    var nibName: String? { get set }
    var reuseIdentifier: String { get set }
    var indexPath: IndexPath? { get set }
    var routingEntry: RoutingEntry? { get set }

}

protocol TableCellViewModel: CellViewModel {
    var height: Float { get }

}

protocol TableEditedCellViewModel: TableCellViewModel {
    var canEdit : Bool { get }
    func completionEdit(callback: @escaping (RecipeError?) -> ())
}
