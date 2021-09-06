//
//  TableViewController.swift
//  VKClient_EVSTARSHOV
//
//  Created by Евгений Старшов on 26.08.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    


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
    
    @IBAction func addFriend(_ sender: Any) {
        let addName = UIAlertController(
        title: "Добавить друга",
        message: nil,
        preferredStyle: .alert
        )
        addName.addTextField()
        
        func getName() -> String {
        let submitName = UIAlertAction(title: "Ok", style: .default) { [unowned addName] _ in
        let answerName = addName.textFields![0]
            return answerName
        }
        addName.addAction(submitName)
        present(addName, animated: true)
        }
        
        print(getName())
        let addGroup = UIAlertController(
        title: "В какой он группе?",
        message: nil,
        preferredStyle: .alert
        )
        addGroup.addTextField()
        let submitGroup = UIAlertAction(title: "Ok", style: .default)
        addGroup.addAction(submitGroup)
        
        present(addGroup, animated: true)
        //friendsArray.append(Friends(image: nil, name: getName, groups: submitGroup))
    }
}
