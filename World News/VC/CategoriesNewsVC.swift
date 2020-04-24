//
//  CategoriesNewsVC.swift
//  World News
//
//  Created by Alaa Adel on 4/23/20.
//  Copyright © 2020 Alaa Adel. All rights reserved.
//

import UIKit



class CategoriesNewsVC: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var article = [Article]()
    var countryName = "eg"
    var category = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(categoriesNewsTableViewCell.nib(), forCellReuseIdentifier: categoriesNewsTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        NewsArticle()
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
    
    // tableView .....
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return article.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: categoriesNewsTableViewCell.identifier, for: indexPath) as! categoriesNewsTableViewCell
        cell.configure(with: article[indexPath.row])
        return cell
    }
    
   @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}


