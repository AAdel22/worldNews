//
//  articleTableViewCell.swift
//  World News
//
//  Created by Alaa Adel on 4/23/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit
import Kingfisher

class articleTableViewCell: UITableViewCell {
    @IBOutlet weak var articleImageView: UIImageView!
    
    @IBOutlet weak var articleTitle: UILabel!
    
    @IBOutlet weak var articleDescription: UILabel!
    
    @IBOutlet weak var articlePublishAt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static let identifier = "articleTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "articleTableViewCell",
                     bundle: nil)
    }
    
    func configure(with model: Article) {
        self.articleTitle.text = model.title
        self.articleDescription.text = model.description
        self.articlePublishAt.text = model.publishedAt
        self.articleImageView.kf.setImage(with: URL(string: model.urlToImage))
    }
    
}
