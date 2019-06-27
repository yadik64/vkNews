//
//  NewsCell.swift
//  VkNews
//
//  Created by Дмитрий Яровой on 25/06/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet var post: UILabel!
    @IBOutlet var photoView: UIImageView!
    
    override func prepareForReuse() {
        post.text = nil
        photoView.image = nil
    }
}
