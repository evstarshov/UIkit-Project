//
//  friends.swift
//  VKClient_EVSTARSHOV
//
//  Created by Евгений Старшов on 26.08.2021.
//

import UIKit

struct PhotoGallery {
    let galleryImage: UIImage?
    let description: String?
}


class Friends {
    let image: UIImage?
    let name: String
    let secondname: String
    let groups: String
    let gallery: [PhotoGallery]?
    
    init(image: UIImage?, name: String, secondname: String, groups: String, gallery: [PhotoGallery]?) {
        self.image = image
        self.name = name
        self.secondname = secondname
        self.groups = groups
        self.gallery = gallery
    }
}

var friendsArray = [
    Friends(image: UIImage(named: "Алена")!, name: "Алена ", secondname: "Харитонова ", groups: "Cлавянки", gallery: [PhotoGallery(galleryImage: UIImage(named: "1")!, description: "подружка")]),
    Friends(image: UIImage(named: "Елена")!, name: "Елена ", secondname: "Филатова", groups: "Спортсменки", gallery: [PhotoGallery(galleryImage: UIImage(named: "2")!, description: "я")]),
    Friends(image: UIImage(named: "Мария")!, name: "Мария ", secondname: "Кичук", groups: "Отличницы", gallery: [PhotoGallery(galleryImage: UIImage(named: "3")!, description: "типа я"), PhotoGallery(galleryImage: UIImage(named: "4")!, description: "с подружкой")]),
    Friends(image: UIImage(named: "Наталья")!, name: "Наталья ", secondname: "Харитонова", groups: "Cлавянки", gallery: [PhotoGallery(galleryImage: UIImage(named: "5")!, description: "сестричка"), PhotoGallery(galleryImage: UIImage(named: "6")!, description: "я опять"), PhotoGallery(galleryImage: UIImage(named: "7")!, description: "киса")])
    ]

extension Friends: Equatable {
    static func == (lhs: Friends, rhs: Friends) -> Bool {
        lhs.name == rhs.name && lhs.groups == rhs.groups
    }
    
}
