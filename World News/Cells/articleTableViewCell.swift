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
    
    @IBOutlet weak var articleBackgroundView: UIView!
    
    var isAnimated = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellDesign()
    }

    
    static let identifier = "articleTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "articleTableViewCell",
                     bundle: nil)
    }
    func cellDesign() {
        self.articleBackgroundView.layer.cornerRadius = 25
        self.articleBackgroundView.layer.borderWidth = 3
        self.articleBackgroundView.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.articleBackgroundView.clipsToBounds = true
    }
    func configure(with model: Article) {
        self.articleTitle.text = model.title
        self.articleDescription.text = model.description
        self.articlePublishAt.text = model.publishedAt
        self.articleImageView.kf.setImage(with: URL(string: model.urlToImage ?? ""))
    }
    
}
