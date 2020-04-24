//
//  categoriesNewsTableViewCell.swift
//  World News
//
//  Created by Alaa Adel on 4/24/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit

class categoriesNewsTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    @IBOutlet weak var articlePublichAtLabel: UILabel!
    
    static let identifier = "categoriesNewsTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "categoriesNewsTableViewCell",
                     bundle: nil)
    }
    
    func configure(with model: Article) {
        self.articleTitleLabel.text = model.title
        self.articleDescriptionLabel.text = model.description
        self.articlePublichAtLabel.text = model.publishedAt
        self.articleImageView.kf.setImage(with: URL(string: model.urlToImage))
    }
    
}
