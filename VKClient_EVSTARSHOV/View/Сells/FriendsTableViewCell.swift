//
//  FriendsTableViewCell.swift
//  VKClient_EVSTARSHOV
//
//  Created by Евгений Старшов on 26.08.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet var friendImageAvatar: AvatarImage!
    @IBOutlet var friendNameLabel: UILabel!
    @IBOutlet var friendGroupLabel: UILabel!
    @IBOutlet var avatarView: AvatarView!
    
    @objc private func tapImageView() {
        avatarView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(
                withDuration: 1.6,
                delay: 0,
                usingSpringWithDamping: 0.4,
                initialSpringVelocity: 0.2,
                options: .curveEaseOut,
                animations: {
                    self.avatarView.transform = CGAffineTransform(scaleX: 1, y: 1)
                },
                completion: nil)
        }
    
    override func awakeFromNib() {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapImageView))
        avatarView.addGestureRecognizer(gestureRecognizer)
        avatarView.isUserInteractionEnabled = true

    }
        

 
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    func configure(friend: Friends) {
        friendImageAvatar.image = friend.image
//      friendGroupImage.image = nil
        friendNameLabel.text = friend.name + friend.secondname
        friendGroupLabel.text = friend.groups
        contentMode = .scaleAspectFill
        
    }
    
}


final class AvatarView: UIView {
    

    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.height / 2
    }
    
}
