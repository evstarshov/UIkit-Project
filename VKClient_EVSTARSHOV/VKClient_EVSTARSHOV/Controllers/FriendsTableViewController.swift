//
//  TableViewController.swift
//  VKClient_EVSTARSHOV
//
//  Created by Евгений Старшов on 26.08.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    private let friendsArray = [
        Friends(image: UIImage(named: "Алена"), name: "Алена Харитонова", groups: "Cлавянки"),
        Friends(image: UIImage(named: "Елена"), name: "Елена Филатова", groups: "Спортсменки"),
        Friends(image: UIImage(named: "Мария"), name: "Мария Кичук", groups: "Отличницы")
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(
            UINib(
                           nibName: "FriendsTableViewCell",
                            bundle: nil),
                           forCellReuseIdentifier: "myfriendCell")
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friendsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "myfriendCell",
                for: indexPath) as? FriendsTableViewCell
        else { return UITableViewCell() }
        cell.configure(friend: friendsArray[indexPath.row])
        //let index = IndexPath(row: 1, section: 0)
        //let currentFriend = friendsArray[indexPath.row]
        //cell.textLabel?.text = friendsArray[indexPath.row].name
        //cell.imageView?.image = friendsArray[indexPath.row].image
        //cell.accessoryType = .disclosureIndicator
        //cell.detailTextLabel?.text = ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(at: indexPath, animated: true)
        }
        performSegue(
            withIdentifier: "showPhotoSegue",
            sender: nil)
    
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        54.0
    }
}
