//
//  StateDetailTableViewController.swift
//  Representatives Master
//
//  Created by Greg Hughes on 12/13/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//


import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var representative : [Representative] = [] {
        
        didSet{
            
            reloadView()
        }
    }
    
    
    
    var state : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let state = state else { return }
        
        RepresentativeController.searchRepresentatives(forState: state) { (representatives) in
            guard let representatives = representatives else { return }
            
            self.representative = representatives
        }
        
        
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representative.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailTableViewCell
        
        let representative = self.representative[indexPath.row]
        
        cell.representative = representative
        
        // Configure the cell...
        
        return cell
    }
    
    
    func reloadView(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}
