//
//  MenuTableTableViewController.swift
//  Restaurant
//
//  Created by Mohammed Uddin on 05/19/2021.
//  Copyright © 2021 Mohammed Uddin. All rights reserved.


import UIKit

class MenuTableViewController: UITableViewController {
    /// The category name we should receive from CategoryTableViewController
    var category: String!
    
    /// Array of menu items to be displayed in the table
    var menuItems = [MenuItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = category.capitalized
        
        // Load the menu for a given category
        MenuController.shared.fetchMenuItems(categoryName: category) { (menuItems) in
            // if we indeed got the menu items
            if let menuItems = menuItems {
                // update the interface
                self.updateUI(with: menuItems)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        fitDetailLabels()
    }
    
    override func viewWillLayoutSubviews() {
        // fit the detail (price) labels
        fitDetailLabels()
    }
    
    
    func updateUI(with menuItems: [MenuItem]) {
        DispatchQueue.main.async {
         
            self.menuItems = menuItems
            
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCellIdentifier", for: indexPath)

        configure(cell: cell, forItemAt: indexPath)

        return cell
    }
    
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        
        cell.textLabel?.text = menuItem.name
        
        cell.detailTextLabel?.text = String(format: "$%.2f", menuItem.price)
        
        MenuController.shared.fetchImage(url: menuItem.imageURL) { image in
            guard let image = image else { return }
            
            DispatchQueue.main.async {
                guard let currentIndexPath = self.tableView.indexPath(for: cell) else { return }
                
                guard currentIndexPath == indexPath else { return }
                
                cell.imageView?.image = image
                
                self.fitImage(in: cell)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    /*
    // Override to support conditional editing of the table view.
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MenuDetailSegue" {
            let menuItemDetailViewController = segue.destination as! MenuItemDetailViewController
            
            let index = tableView.indexPathForSelectedRow!.row
            
            menuItemDetailViewController.menuItem = menuItems[index]
        }
    }

}
