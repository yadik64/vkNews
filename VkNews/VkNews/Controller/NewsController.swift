//
//  NewsController.swift
//  VkNews
//
//  Created by Дмитрий Яровой on 25/06/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class NewsController: UIViewController {
    
    var newsArray = [NewsModel]()
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createData()
        
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: NewsCell.className(), bundle: .main), forCellReuseIdentifier: NewsCell.className())
        tableView.register(UINib(nibName: NewsTableHeader.className(), bundle: .main), forHeaderFooterViewReuseIdentifier: NewsTableHeader.className())
        tableView.register(UINib(nibName: NewsTableFooter.className(), bundle: .main), forHeaderFooterViewReuseIdentifier: NewsTableFooter.className())
    }
    
    
    
    private func createData() {
        let prichodko = NewsModel()
        let prichodko2 = NewsModel()
        prichodko2.postPhoto = "3"
        prichodko2.name = "Вася Пупкин"
        let prichodko3 = NewsModel()
        prichodko3.postPhoto = "4"
        newsArray.append(prichodko)
        newsArray.append(prichodko3)
        newsArray.append(prichodko2)
        newsArray.append(prichodko)
        newsArray.append(prichodko)
    }
    
}

extension NewsController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.className(), for: indexPath) as! NewsCell
        
        cell.post.text = newsArray[indexPath.section].post
        
        if let photo = newsArray[indexPath.section].postPhoto {
            cell.photoView.image = UIImage(named: photo)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: NewsTableHeader.className()) as! NewsTableHeader
        
        header.contentView.backgroundColor = .white
        
        header.nameLabel.text = newsArray[section].name
        header.dateLabel.text = newsArray[section].date.description
        header.photo.photo = UIImage(named: newsArray[section].photo)

        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: NewsTableFooter.className()) as! NewsTableFooter
        
        footer.contentView.backgroundColor = .white
        footer.separatorView.backgroundColor = tableView.backgroundColor
        
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    
}
