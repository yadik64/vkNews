//
//  AvatarView.swift
//  VkNews
//
//  Created by Дмитрий Яровой on 25/06/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class AvatarView: UIView {

    private var imageView: UIImageView!
    public var photo: UIImage? {
        willSet {
            imageView.image = newValue
        }
    }
    
    override func awakeFromNib() {
        imageView = UIImageView(frame: bounds)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = imageView.frame.width / 2.0
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = #colorLiteral(red: 0.2901960784, green: 0.5215686275, blue: 0.6980392157, alpha: 1)
        addSubview(imageView)
        
        layer.cornerRadius = layer.frame.width / 2
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowOpacity = 0.5
        layer.shadowColor = #colorLiteral(red: 0.2901960784, green: 0.5215686275, blue: 0.6980392157, alpha: 1)
    }

}


