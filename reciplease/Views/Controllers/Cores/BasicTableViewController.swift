//
//  BasicTableViewController.swift
//  reciplease
//
//  Created by Paul Ghibeaux on 23/09/2021.
//

import UIKit

private let reuseIdentifier = "Cell"

class BasicTableViewController: UITableViewController {
    // MARK: - Properties

    var viewModel: ViewModel?
           
    // MARK: - Init

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "BasicTableViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    
        // MARK: - Datasource / delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let vm = self.viewModel else {
            return 0
        }
        return vm.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = self.viewModel else {
            return 0
        }
        
        
        return vm.numberOfItems(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return UITableViewCell()
        }
        
        let reuseIdentifier = cellVM.reuseIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
                                                 for: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return
        }
            
        cell.configure(cellViewModel: cellVM,
                       from: self)
    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellVM = self.viewModel?.item(at: indexPath) else {
            return
        }
                        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellVM.reuseIdentifier)
        cell?.cellPressed(cellViewModel: cellVM,
                          from: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellVM = self.viewModel?.item(at: indexPath) as? TableCellViewModel else {
            return UITableView.automaticDimension
        }
        
        return CGFloat(cellVM.height)
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellVM = self.viewModel?.item(at: indexPath) as? TableCellViewModel else {
            return 0
        }
        
        return CGFloat(cellVM.height)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard let cellVM = self.viewModel?.item(at: indexPath) as? TableEditedCellViewModel else {
            return
        }
        
        if editingStyle == .delete {
            cellVM.completionEdit { [weak self] error in
                guard error != nil else {
                    let newRouting = Routing()
                    
                    let alert = AlertRoutingEntry(message: "error", title: NSLocalizedString("Error", comment: "Error"))
                    
                    _ = newRouting
                        .route(routingEntry: alert, fromController: self!, animated: true)
                    return
                }
                self?.viewModel?.remove(at: indexPath)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
        }
    }
    
   override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        guard let cellVM = self.viewModel?.item(at: indexPath) as? TableEditedCellViewModel else {
            return .none
        }
        
        if cellVM.canEdit {
                return .delete
            }
            
            else {
                return .none
            }
       }
    
   
  
  
    
    // MARK: - Register
    public func registerCells() {
        guard let sections = self.viewModel?.sections else { return }
        
        
        for i in 0..<sections.count {
            var section = sections[i]
            
            // We store section position
            section.position = i
            
            let items = section.cellsVM
            
            for j in 0..<items.count {
                let item = items[j]
                
                // We store index path for item
                item.indexPath = IndexPath(row: j,
                                           section: i)
              
                // If we don't have a nibName, we use the default UITableViewCell
                guard let nibName = item.nibName else {
                    tableView.register(UITableViewCell.self,
                                       forCellReuseIdentifier: item.reuseIdentifier)
                    continue
                }
                         
                
                // Otherwise we use the one from the xib
                let nib = UINib(nibName: nibName,
                                bundle: Bundle(for: type(of: item)))
                self.tableView.register(nib,
                                        forCellReuseIdentifier: item.reuseIdentifier)
            }
                        
        }
        
        
        
    }
    
}
