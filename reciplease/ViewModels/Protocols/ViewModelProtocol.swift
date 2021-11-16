//
//  ViewModelProtocol.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation

// protocol to set up viewmodel

protocol ViewModel {
    //each viewmodel have section and load data function
    var sections: [Section] { get set }
    
    func loadData(callback: @escaping (Error?) -> ())
    var shouldDisplayBackButton : Bool { get  }

}

extension ViewModel {
    // each vm have a number of sections
    func numberOfSections() -> Int {
        return self.sections.count
    }
    // each vm have a number of items in each sections
    func numberOfItems(in section: Int) -> Int {
        guard self.sections.count > 0 else {
            return 0
        }
        return self.sections[section].cellsVM.count
    }
    
    func item(at indexPath: IndexPath) -> CellViewModel {
        return self.sections[indexPath.section].cellsVM[indexPath.row]
    }
    // for editing tableeditedCellviewmodels
    mutating func remove(at indexPath : IndexPath) -> () {
        self.sections[indexPath.section].cellsVM.remove(at: indexPath.row)
    }
}

