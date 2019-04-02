//
//  NYArticleCell.swift
//  NVMPA
//
//  Created by Aftab Ahmed on 4/2/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import UIKit

class NYArticleCell: UITableViewCell {
    
    //**************************************************
    // MARK: - IBOutlets
    //**************************************************
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    //**************************************************
    // MARK: - Methods
    //**************************************************
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(_ model: NewsModel) {
        self.titleLabel.text = model.title
        self.byLineLabel.text = model.byLine
        self.publishedDateLabel.text = model.publishedDate
        self.viewsLabel.text = "Views: \(model.views)"
    }
}

