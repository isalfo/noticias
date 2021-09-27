//
//  WebService.swift
//  Noticias
//
//  Created by Gonzalo Alfonso on 27/09/2021.
//

import Foundation
// MARK: WebService class
final class WebService {
  
  func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      if let error = error {
        //TODO: UIAlert with error
        debugPrint(error.localizedDescription)
        completion(nil)
      } else if let data = data {
        
        let articlesList = try? JSONDecoder().decode(ArticlesList.self, from: data)
        
        if let articlesList = articlesList {
          completion(articlesList.articles)
        }
        print(articlesList?.articles ??  "")
      }
    }.resume()
  }
}
