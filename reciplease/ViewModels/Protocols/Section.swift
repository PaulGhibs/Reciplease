//
//  Section.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation
 
// MARK: - Section view models
protocol Section {
    // each section have title, a position and array of cellvm
    var position: Int { get set }
    var title: String { get set }
    var cellsVM: [CellViewModel] { get set }
}

protocol TableSection: Section {
    // define the height for each headers 
    var heightForHeader: Int { get }
}
