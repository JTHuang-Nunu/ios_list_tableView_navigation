//
//  TableViewController.swift
//  hw2_list
//
//  Created by mac03 on 2023/3/21.
//

import UIKit

class TableViewController: UITableViewController {
    var doType:Int = 0
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    var names = ["Ano","水曜日のカンパネラ","羊文学","Lilas Ikuta","Miwa"]
    var images = ["ano","Campanella","hitsuchi bungaku","Lilas Ikuta","miwa"]
    var locations = ["Japan","Japan","Japan","Japan","Japan"]
    
    @IBAction func Add(_ sender: UIButton) {
        if(doType == 0){
            doType = 1
            addButton.setTitle( "DONE", for: .normal)
//            deleteButton.isEnabled = false
            tableView.isEditing = true
        }
        else if(doType == 1){
            doType = 0
            addButton.setTitle( "ADD", for: .normal)
            deleteButton.isEnabled = true
            tableView.isEditing = false
            
        }
        tableView.reloadData()
    }
    
    @IBAction func Delete(_ sender: UIButton) {
        if(doType == 0){
            doType = 2
            deleteButton.setTitle( "DONE", for: .normal)
            addButton.isEnabled = false
            tableView.isEditing = true
        }
        else if(doType == 2){
            doType = 0
            deleteButton.setTitle( "DEL", for: .normal)
            addButton.isEnabled = true
            tableView.isEditing = false
            
        }
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isEditing = false
        self.title = "Favorite singer"
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return names.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.nameLabel?.text = names[indexPath.row]
        cell.locationLabel?.text = locations[indexPath.row]
        cell.thumbnail?.image = UIImage(named: images[indexPath.row])
 

        return cell
    }
    
    var nameLabel: String?
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mystoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        let vc = mystoryBoard.instantiateViewController(withIdentifier: "SubView") as! SubViewController
        vc.name = String(names[indexPath.row])
        vc.image = String(images[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            names.remove(at: indexPath.row)
            locations.remove(at: indexPath.row)
            images.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        } else if editingStyle == .insert {
            let currentName = names[indexPath.row]
            let currentImage = images[indexPath.row]
            let currentLocation = locations[indexPath.row]
            names.insert(currentName , at: indexPath.row)
            images.insert(currentImage, at: indexPath.row)
            locations.insert(currentLocation, at: indexPath.row)
            // Delete the row from the data source
            tableView.insertRows(at: [indexPath], with: .fade)
            tableView.reloadData()

            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if(doType==1){
            return .insert
        }else if(doType==2){
            return .delete
        }
        return .none
        
        
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let tmpName = names[fromIndexPath.row]
        let tmpLocation = locations[fromIndexPath.row]
        let tmpImage = images[fromIndexPath.row]
        names.remove(at: fromIndexPath.row)
        names.insert(tmpName, at: to.row)
        images.remove(at: fromIndexPath.row)
        images.insert(tmpImage, at: to.row)
        locations.remove(at: fromIndexPath.row)
        locations.insert(tmpLocation, at: to.row)
    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using qe.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
