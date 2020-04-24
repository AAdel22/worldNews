//
//  NewsVC.swift
//  World News
//
//  Created by Alaa Adel on 4/22/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit
import SafariServices
import Kingfisher

class NewsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
   
    
    let transtion = SlideInTransition()
    var countryName = ""
    var article = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(articleTableViewCell.nib(), forCellReuseIdentifier: articleTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        NewsArticle()
    }
    
    
    func NewsArticle() {
       
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=\(countryName)&apiKey=3fe5d71299684d52ab6c50568931d80c")
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
        let url = String(article[indexPath.row].url)
       
        let vc = SFSafariViewController(url: URL(string: url)!)
        present(vc, animated: true, completion: nil)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func menuBtn(_ sender: Any) {
        guard let MenuVC = storyboard?.instantiateViewController(withIdentifier: "MenuTableVC")  else {return}
        
        MenuVC.modalPresentationStyle = .overCurrentContext
        MenuVC.transitioningDelegate = self
        present(MenuVC, animated: true, completion: nil)
    }
    
}
struct ArticleResult: Codable {
    let articles: [Article]
}
struct Article: Codable {
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    
    private enum CodingKeys: String, CodingKey {
        case title, description, url, urlToImage, publishedAt
    }
}
extension NewsVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transtion.isPresenting = true
        return transtion
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transtion.isPresenting = false
        return transtion
    }
}


