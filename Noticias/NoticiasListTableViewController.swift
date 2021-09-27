//
//  NoticiasListTableViewController.swift
//  Noticias
//
//  Created by Gonzalo Alfonso on 27/09/2021.
//

import Foundation
import UIKit
// MARK: NoticiasListTableViewController class
final class NoticiasListTableViewController: UITableViewController {
  
  // MARK: - Properties
  var articlesListVM: ArticleListViewModel!
  
  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }
  
  // MARK: - Private methods
  private func setup() {
    self.navigationController?.navigationBar.prefersLargeTitles = true
    
    guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=f923c53a6e874797856a976e04647f9c") else { return }
    
    WebService().getArticles(url: url) { articles in
      
      if let articles = articles {
        
        self.articlesListVM = ArticleListViewModel(articles: articles)
        
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }
    }
  }
  
  // MARK: - TableView methods
  override func numberOfSections(in tableView: UITableView) -> Int {
    return self.articlesListVM == nil ? 0 : self.articlesListVM.numberOfSections
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return articlesListVM.numberOfRowsInSection(section)
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell
    
    let articleVM = self.articlesListVM.articleAtIndex(indexPath.row)
    
    cell?.titleLabel.text = articleVM.title
    cell?.descriptionLabel.text = articleVM.description
    
    return cell ?? UITableViewCell()
  }
}
