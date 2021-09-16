//
//  Section.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation


protocol Section {
    var position: Int { get set }
    var title: String { get set }
    var cellsVM: [CellViewModel] { get set }

}
