//
//  MainArticleTableViewCell.swift
//  World News
//
//  Created by Alaa Adel on 4/23/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit

class MainArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var desciptionLabel: UILabel!
    @IBOutlet weak var articleTimePublish: UILabel!
    
    @IBOutlet weak var articleImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static let identifier = "mainCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "mainCell",
                     bundle: nil)
    }
    
//    func configure(with model: Article) {
////        self.titleLabel.text = model.title
////        self.desciptionLabel.text = model.description
////        self.articleTimePublish.text = model.publishedAt
////        let url = model.urlToImage
////        if let data = try? Data(contentsOf: URL(string: url)!) {
////            self.articleImageView.image = UIImage(data: data)
////        }
//    }
}
