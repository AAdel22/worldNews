//
//  MenuTableVC.swift
//  World News
//
//  Created by Alaa Adel on 4/23/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit

class MenuTableVC: UITableViewController {

    var items = ["business","health","entertainment","science","sports","technology"]
    var itemsPic = [#imageLiteral(resourceName: "business"),#imageLiteral(resourceName: "health"),#imageLiteral(resourceName: "entertainment"),#imageLiteral(resourceName: "science"),#imageLiteral(resourceName: "sports"),#imageLiteral(resourceName: "technology")]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
        tableView.backgroundColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
//        cell.imageView?.image = itemsPic[indexPath.row]
//        cell.imageView?.contentMode = .scaleAspectFit
//        cell.imageView?.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        cell.backgroundColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
//        let vc = storyboard?.instantiateViewController(withIdentifier: "CategoriesNewsVC") as! CategoriesNewsVC
//        
//        if indexPath.row == 0 {
//            vc.category = "business"
//        } else if indexPath.row == 1 {
//            vc.category = "health"
//        }else if indexPath.row == 2 {
//            vc.category = "entertainment"
//        }else if indexPath.row == 3 {
//            vc.category = "science"
//        }else if indexPath.row == 4 {
//            vc.category = "sports"
//        }else if indexPath.row == 5 {
//            vc.category = "technology"
//        }
//        
//        present(vc, animated: true, completion: nil)
    }
}
