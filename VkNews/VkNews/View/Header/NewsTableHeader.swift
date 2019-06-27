//
//  NewsTableHeader.swift
//  VkNews
//
//  Created by Дмитрий Яровой on 25/06/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class NewsTableHeader: UITableViewHeaderFooterView {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var photo: AvatarView!
    
    override func prepareForReuse() {
        self.nameLabel.text = nil
        self.dateLabel.text = nil
        self.photo.photo = nil
    }

}
