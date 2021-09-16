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
}

protocol TableCellViewModel: CellViewModel {
    var height: Float { get }
    var estimatedHeight: Float { get }
}
