//
//  friends.swift
//  VKClient_EVSTARSHOV
//
//  Created by Евгений Старшов on 26.08.2021.
//

import UIKit

struct Friends {
    let image: UIImage?
    let name: String
    let secondname: String
    let groups: String
}

var friendsArray = [
    Friends(image: UIImage(named: "Алена"), name: "Алена ", secondname: "Харитонова ", groups: "Cлавянки"),
    Friends(image: UIImage(named: "Елена"), name: "Елена ", secondname: "Филатова", groups: "Спортсменки"),
    Friends(image: UIImage(named: "Мария"), name: "Мария ", secondname: "Кичук", groups: "Отличницы"),
    Friends(image: UIImage(named: "Алена"), name: "Наталья ", secondname: "Харитонова", groups: "Cлавянки")
    ]

extension Friends: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name && lhs.groups == rhs.groups
    }
    
}
