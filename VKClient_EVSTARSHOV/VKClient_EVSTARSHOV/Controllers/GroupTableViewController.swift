//
//  GroupTableViewController.swift
//  VKClient_EVSTARSHOV
//
//  Created by Евгений Старшов on 26.08.2021.
//

import UIKit

class GroupTableViewController: UITableViewController {
    
    private var groupsArray = [
        Groups(groupname: "Спортсменки", groupimage: UIImage(named: "Спортсменка")),
        Groups(groupname: "Славянки", groupimage: UIImage(named: "Славянка")),
        Groups(groupname: "Отличницы", groupimage: UIImage(named: "Отличница"))
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groupsArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(
                withIdentifier: "groupsCell",
                for: indexPath)
        let index = IndexPath(row: 1, section: 0)
        let currentGroup = groupsArray[indexPath.row]
        cell.textLabel?.text = groupsArray[indexPath.row].groupname
        cell.imageView?.image = groupsArray[indexPath.row].groupimage
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.text = ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(at: indexPath, animated: true)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
