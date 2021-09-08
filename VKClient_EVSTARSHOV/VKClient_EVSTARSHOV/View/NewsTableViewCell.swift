//
//  NewsTableViewCell.swift
//  VKClient_EVSTARSHOV
//
//  Created by Евгений Старшов on 08.09.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet var newsTitleCell: UILabel!
    @IBOutlet var newsTextCell: UILabel!
    @IBOutlet var newsImageCell: UIImageView!
    @IBOutlet var avatarImageCell: AvatarImage!
    @IBOutlet var friendLabelCell: UILabel!
    @IBOutlet var commentsTable: UITableView!
    @IBOutlet var likeBtn: UIButton!
    @IBOutlet var commentTextField: UITextField!
    @IBOutlet var submitBtn: UIButton!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func configureNews(model: NewsModel) {
        newsTitleCell.text = model.newsTitle
        newsTextCell.text = model.newsText
        newsImageCell.image = model.newsImage
        avatarImageCell.image = model.friendPosted.image
        friendLabelCell.text = model.friendPosted.name
    }
    
}
