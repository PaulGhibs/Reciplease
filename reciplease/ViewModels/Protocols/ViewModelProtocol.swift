//
//  ViewModelProtocol.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 14/09/2021.
//

import Foundation


protocol ViewModel {
    var sections: [Section] { get set }
    
    func loadData(callback: () -> ())
}

extension ViewModel {
    func numberOfSections() -> Int {
        return self.sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        guard self.sections.count > 0 else {
            return 0
        }
        return self.sections[section].cellsVM.count
    }
    
    func item(at indexPath: IndexPath) -> CellViewModel {
        return self.sections[indexPath.section].cellsVM[indexPath.row]
    }
}
