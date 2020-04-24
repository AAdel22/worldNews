//
//  categoriesNewsCell.swift
//  World News
//
//  Created by Alaa Adel on 4/23/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit

class categoriesNewsCell: UITableViewCell {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    @IBOutlet weak var articlePublichAtLabel: UILabel!
    
    func configure(with model: Article) {
        self.articleTitleLabel.text = model.title
        self.articleDescriptionLabel.text = model.description
        self.articlePublichAtLabel.text = model.publishedAt
        self.articleImageView.kf.setImage(with: URL(string: model.urlToImage))
    }
}
