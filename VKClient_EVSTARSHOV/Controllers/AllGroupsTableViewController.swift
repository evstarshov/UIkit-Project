//
//  AllGroupsTableViewController.swift
//  VKClient_EVSTARSHOV
//
//  Created by Евгений Старшов on 07.09.2021.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {
    
    var groups = [
        Groups(groupname: "Спортсменки", groupimage: UIImage(named: "Спортсменка")),
        Groups(groupname: "Славянки", groupimage: UIImage(named: "Славянка")),
        Groups(groupname: "Отличницы", groupimage: UIImage(named: "Отличница"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            groups.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(
                    withIdentifier: "allGroupsCell",
                    for: indexPath)
            //let index = IndexPath(row: 1, section: 0)
            //let currentGroup = filteredGroups[indexPath.row]
            cell.textLabel?.text = groups[indexPath.row].groupname
            cell.imageView?.image = groups[indexPath.row].groupimage
            cell.accessoryType = .disclosureIndicator
            cell.detailTextLabel?.text = ""
            return cell
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(
                at: indexPath,
                animated: true)
        }
        
        performSegue(
            withIdentifier: "addGroupSegue",
            sender: nil)
    }
    }

