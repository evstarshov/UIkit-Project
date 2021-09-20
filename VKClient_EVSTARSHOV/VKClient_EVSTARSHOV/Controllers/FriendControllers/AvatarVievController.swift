

import UIKit

class AvatarVievController: UIViewController {
    
    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var avatarLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var likeLabel: UILabel!
    var likes = 0
    private var friend: Friends?
    
    let imagecollectionArray:[UIImage] = [
        UIImage(named: "Алена")!,
        UIImage(named: "Елена")!,
        UIImage(named: "Мария")!,
        UIImage(named: "Наталья")!

    ]

//    var friend: Friends? {
//        didSet {
//            if friend != nil {
//            configureFriend(modelfriends: friend!)
//            }
//        }
//    }
//
    //------------ Конфигурирование UIImage, UILabel
    func configureFriend(modelfriends: Friends) {
        friend = modelfriends
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let friendData = friend else {return}
        avatarImage?.image = friendData.image
        avatarLabel?.text = friendData.name + friendData.secondname
        
        
        let panGR = UIPanGestureRecognizer(
            target: self,
            action: #selector(didPan(_:)))
        avatarImage.isUserInteractionEnabled = true
        avatarImage.addGestureRecognizer(panGR)
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
////        guard let avatar = avatarImage else {
////            return
////        }
////        avatar.image = UIImage(named: "Алена")
//        likeButton.setImage(UIImage(named: "heart"), for: .normal)
//    }

    // ------- Кнопка лайк
    @IBAction func likePressed(_ sender: Any) {
        if likeButton?.isSelected == false {
        print("Liked")

        likeButton.isSelected = true
        likes += 1
        likeLabel.text = String(likes)
        likeButton.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            UIView.animate(withDuration: 1.6,
                           delay: 0,
                           usingSpringWithDamping: 0.4,
                           initialSpringVelocity: 0.2,
                           options: .curveEaseOut,
                           animations: {
                               self.likeButton.transform = CGAffineTransform(scaleX: 1, y: 1)
                           },
                           completion: nil)
        likeButton.setImage(UIImage(named: "heartfill"), for: .selected)
        } else {
            print("Disliked")
            likeButton.isSelected = false
            likes -= 1
            likeLabel.text = String(likes)
        }
        
    }

    
    // --------- Блок анимаций перелистывания
    
    
    private var propertyAnimator: UIViewPropertyAnimator?
    
    private var isAnimated = false
    
    private let duration = 2.0
    private let delay = 0.5
    
    @objc
    private func didPan(_ gesture: UIPanGestureRecognizer){
        switch gesture.state {
        case .began:
            propertyAnimator = UIViewPropertyAnimator(
                duration: duration,
                curve: .easeInOut,
                animations: {
                    let transform = CGAffineTransform(rotationAngle: .pi / 2)
                    self.avatarImage.transform = transform
                })
            propertyAnimator?.pauseAnimation()
        case .changed:
            let translation = gesture.translation(in: self.avatarImage)
            propertyAnimator?.fractionComplete = -translation.y / 100
        case .ended:
            if propertyAnimator?.fractionComplete ?? 0.0 > 0.5 {
                propertyAnimator?.continueAnimation(
                    withTimingParameters: nil,
                    durationFactor: 0)
            } else {
                propertyAnimator?.stopAnimation(true)
                propertyAnimator?.finishAnimation(at: .current)
            }
            
        default:
            return
        }
    }
    
    @IBAction func imagelisting (_ sender: Any?) {
        
    }

}
