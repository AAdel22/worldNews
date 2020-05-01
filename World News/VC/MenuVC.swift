//
//  MenuVC.swift
//  World News
//
//  Created by Alaa Adel on 5/1/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit

class MenuVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var items = ["business","health","entertainment","science","sports","technology"]
    var itemsPic = [#imageLiteral(resourceName: "business"),#imageLiteral(resourceName: "health"),#imageLiteral(resourceName: "entertainment"),#imageLiteral(resourceName: "science"),#imageLiteral(resourceName: "sports"),#imageLiteral(resourceName: "technology")]
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! menuCell
        cell.categoryLabel.text = items[indexPath.row]
        cell.categoryLabel.textColor = .black
        cell.categoryImageView.image = itemsPic[indexPath.row]
        //cell.backgroundColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
