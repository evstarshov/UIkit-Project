//
//  TableViewController.swift
//  VKClient_EVSTARSHOV
//
//  Created by Евгений Старшов on 26.08.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    @IBOutlet var searchFriendsBar: UISearchBar!
    @IBOutlet var tableViewHeader: FriendsTableHeader!
    
    private var friends = [Friends]() {
        didSet {
            filteredFriends = friends
        }
    }
    
    private var filteredFriends = [Friends]() {
        didSet {
            tableView.reloadData()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        searchFriendsBar.delegate = self
        tableView.register(
            UINib(
                           nibName: "FriendsTableViewCell",
                            bundle: nil),
                           forCellReuseIdentifier: "myfriendCell")
    
        // ----- Загрузка титульного изображения
        
        tableView.register(AllFriendsSectionHeader.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
        
        tableViewHeader.imageView.image = UIImage(named: "tableHeader3")
        tableViewHeader.imageView.contentMode = .scaleAspectFill
        tableView.tableHeaderView = tableViewHeader
    }
    
    // ----- Загрузка титульного изображения

    // ----- Наполнение строк элементами массива
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        friendsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "myfriendCell",
                for: indexPath) as? FriendsTableViewCell
        else { return UITableViewCell() }
        cell.configure(friend: friendsArray[indexPath.row])
        return cell
    }
    // ----- Наполнение строк элементами массива
    
    
   // ----- Титульная строка
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "sectionHeader") as? AllFriendsSectionHeader
        else {return nil}
        sectionHeader.contentView.backgroundColor = .systemBlue
        return sectionHeader
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Все друзья"
    }
    // ------ Титульная строка
    
    // ------ Переход на экран коллекции
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(at: indexPath, animated: true)
        }
        performSegue(
            withIdentifier: "showPhotoSegue",
            sender: nil)
    
    }
    
    // ------ Переход на экран коллекции
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        54.0
    }

}

// ---- Расширения для работы поисковой строки

extension FriendsTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterFriends(with: searchText)
    }
    
    private func filterFriends(with text: String) {
        guard !text.isEmpty else {
            filteredFriends = friendsArray
            tableView.reloadData()
            return
        }
        
        filteredFriends = friendsArray.filter { $0.name.lowercased().contains(text.lowercased()) }
    }
}


extension FriendsTableViewController {
    private func sort(_ friendsArray: [Friends]) -> (characters: [Character], sortedFriends: [Character: [Friends]]) {
        var letters = [Character]()
        var sortedFriends = [Character: [Friends]]()
        
        friendsArray.forEach { friend in
            guard let character = friend.name.first else { return }
            if var thisCharFriends = sortedFriends[character] {
                thisCharFriends.append(friend)
                sortedFriends[character] = thisCharFriends
            } else {
                sortedFriends[character] = [friend]
                letters.append(character)
            }
        }
        letters.sort()
        
        return (letters, sortedFriends)
    }
}
// ---- Расширения для работы поисковой строки
