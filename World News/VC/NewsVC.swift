//
//  NewsVC.swift
//  World News
//
//  Created by Alaa Adel on 4/22/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit
import SideMenu
import SafariServices
import Kingfisher

class NewsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
   
    var countryName = ""
    var category = ""
    var article = [Article]()
    
    private var refreshController:UIRefreshControl = UIRefreshControl()
    
    var menu: UISideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(articleTableViewCell.nib(), forCellReuseIdentifier: articleTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        let menuVC = storyboard?.instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
        menu = UISideMenuNavigationController(rootViewController: menuVC)
        SideMenuManager.default.menuLeftNavigationController = menu
        menu?.setNavigationBarHidden(true, animated: false)
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.view)
        
        NewsArticle()
        refreshController.addTarget(self, action: #selector(refreachTableView), for: UIControlEvents.valueChanged)
        self.tableView.refreshControl = refreshController
        self.tableView.addSubview(refreshController)
        print(category)
    }
    
    
    func NewsArticle() {
       
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=\(countryName)&category=\(category)&apiKey=3fe5d71299684d52ab6c50568931d80c")
        URLSession.shared.dataTask(with: url!, completionHandler: ({ (data, response, error) in
            // convert to Json
            var result: ArticleResult?
            do {
                result = try JSONDecoder().decode(ArticleResult.self, from: data!)
            }
            catch {
                print("error: \(error)")
            }
            guard let finalResult = result else {return}
            
            // Update Article array
            let newArticle = finalResult.articles
            print(newArticle)
            self.article.append(contentsOf: newArticle)
            
            // refresh tableView
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        })).resume()
    }
    
    @objc func refreachTableView() {
        
        NewsArticle()
        self.refreshController.endRefreshing()
    }
    // tableView ....
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return article.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: articleTableViewCell.identifier, for: indexPath) as! articleTableViewCell
        cell.configure(with: article[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = String(article[indexPath.row].url ?? "") 
        
        let vc = SFSafariViewController(url: URL(string: url)!)
        present(vc, animated: true, completion: nil)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! articleTableViewCell
        if !cell.isAnimated {
            // the init state of the cell
            cell.alpha = 0
            let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
            cell.layer.transform = transform
            
            // animate the cell to the final state
            UIView.animate(withDuration: 1.0) {
                cell.alpha = 1.0
                cell.layer.transform = CATransform3DIdentity
            }
            cell.isAnimated = true
        }
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func menuBtn(_ sender: Any) {
        
        present(menu!, animated: true, completion: nil)
    }
    
}
struct ArticleResult: Codable {
    let articles: [Article]
}
struct Article: Codable {
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    
    private enum CodingKeys: String, CodingKey {
        case title, description, url, urlToImage, publishedAt
    }
}



