import Foundation

// MARK: - NewsModel
struct NewsModel {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String?
}

// MARK: - Source
struct Source {
    let id: String?
    let name: String
}
