//
//  ArticleViewModel.swift
//  Noticias
//
//  Created by Gonzalo Alfonso on 27/09/2021.
//

import Foundation

// MARK: ArticleListViewModel struct
struct ArticleListViewModel {
  let articles: [Article]
}
// MARK: - ArticleListViewModel extension
extension ArticleListViewModel {
  
  // MARK: - Properties
  var numberOfSections: Int {
    return 1
  }
  // MARK: - Methods
  func numberOfRowsInSection(_ section: Int) -> Int {
    return self.articles.count
  }
  
  func articleAtIndex(_ index: Int) -> ArticleViewModel {
    let article = articles[index]
    return ArticleViewModel(article)
  }
}

// MARK: ArticleViewModel struct
struct ArticleViewModel {
  private let article: Article
}

// MARK: - ArticleListViewModel init
extension ArticleViewModel {
  init(_ article: Article) {
    self.article = article
  }
}
// MARK: - ArticleListViewModel properties
extension ArticleViewModel {
  var title: String {
    return self.article.title ?? ""
  }
  
  var description: String {
    return self.article.description ?? ""
  }
}
