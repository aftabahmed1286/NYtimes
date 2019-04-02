//
//  NewsViewController+TableView.swift
//  NYTMostPopular
//
//  Created by Aftab Ahmed on 4/2/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import UIKit

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = allNewsData else {
            return 0
        }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.articleCellId) as? NYArticleCell,
            let newsData = allNewsData
            else {
                return UITableViewCell()
        }
        let data = newsData[indexPath.row]
        cell.configureCell(data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showNewsDetailViewController(forInt: indexPath.row)
    }
    
    func showNewsDetailViewController(forInt: Int) {
        guard let newsDetailVC = UIStoryboard(name: Constants.storyboardName, bundle: nil).instantiateViewController(withIdentifier: Constants.newsDetailVCId) as? NewsDetailViewController else {
            return
        }
        guard let newsData = allNewsData else {
            return
        }
        let data = newsData[forInt]
        newsDetailVC.url = data.url
        self.navigationController?.pushViewController(newsDetailVC, animated: true)
    }
}
