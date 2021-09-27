//
//  Article.swift
//  Noticias
//
//  Created by Gonzalo Alfonso on 27/09/2021.
//

import Foundation
// MARK: ArticlesList struct
struct ArticlesList: Decodable {
  let articles: [Article]
}

// MARK: Article struct
struct Article: Decodable {
  let title: String?
  let description: String?
}
