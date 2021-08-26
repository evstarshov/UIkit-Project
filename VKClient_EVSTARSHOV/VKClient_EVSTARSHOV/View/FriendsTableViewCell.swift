//
//  FriendsTableViewCell.swift
//  VKClient_EVSTARSHOV
//
//  Created by Евгений Старшов on 26.08.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet var friendImageAvatar: UIImageView!
    @IBOutlet var friendGroupImage: UIImageView!
    @IBOutlet var friendNameLabel: UILabel!
    @IBOutlet var friendGroupLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func configure(friend: Friends) {
        friendImageAvatar.image = friend.image
        friendGroupImage.image = nil
        friendNameLabel.text = friend.name
        friendGroupLabel.text = friend.groups
    }
    
    /*
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    */
}
