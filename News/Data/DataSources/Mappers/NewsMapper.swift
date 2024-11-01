//
//  NewsMapper.swift
//  News
//
//  Created by Yosafat.H.S on 01/11/24.
//

import Foundation
import SwiftyJSON

class NewsMapper {
    static func map(from json: JSON) -> NewsModel? {
        guard let status = json["status"].string,
              let totalResults = json["totalResults"].int else {
            return nil
        }
        
        let articles = json["articles"].arrayValue.compactMap { articleJSON in
            mapArticle(from: articleJSON)
        }
        
        return NewsModel(status: status, totalResults: totalResults, articles: articles)
    }
    
    private static func mapArticle(from json: JSON) -> Article? {
        guard let title = json["title"].string,
              let url = json["url"].string,
              let publishedAtString = json["publishedAt"].string,
              let publishedAt = ISO8601DateFormatter().date(from: publishedAtString) else {
            return nil
        }
        
        let source = mapSource(from: json["source"])
        let author = json["author"].string
        let description = json["description"].string
        let urlToImage = json["urlToImage"].string
        let content = json["content"].string

        return Article(
            source: source,
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publishedAt: publishedAt,
            content: content
        )
    }
    
    private static func mapSource(from json: JSON) -> Source {
        let id = json["id"].string
        let name = json["name"].string ?? "Unknown"
        
        return Source(id: id, name: name)
    }
}
