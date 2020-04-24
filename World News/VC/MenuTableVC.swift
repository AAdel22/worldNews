//
//  MenuTableVC.swift
//  World News
//
//  Created by Alaa Adel on 4/23/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit
enum MenuType: Int {
    case business
    case health
    case entertainment
    case science
    case sports
    case technology
}
class MenuTableVC: UITableViewController {

    var counrtyName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let menuType = MenuType(rawValue: indexPath.row) else {return}
        let CategoriesNewsVC = storyboard?.instantiateViewController(withIdentifier: "CategoriesNewsVC") as! CategoriesNewsVC
        if indexPath.row == 0 {
            print("row is : \(indexPath.row)")
            CategoriesNewsVC.category = "business"
        } else if indexPath.row == 1 {
            CategoriesNewsVC.category = "health"
        }else if indexPath.row == 2 {
            CategoriesNewsVC.category = "entertainment"
        }else if indexPath.row == 3 {
            CategoriesNewsVC.category = "science"
        }else if indexPath.row == 4 {
            CategoriesNewsVC.category = "sports"
        }else if indexPath.row == 5 {
            CategoriesNewsVC.category = "technology"
        }
        
        self.present(CategoriesNewsVC, animated: true, completion: nil)
//        dismiss(animated: true) {
//            print("dismissing \(menuType)")
//        }
    }
}
