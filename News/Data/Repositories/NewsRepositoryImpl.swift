//
//  NewsRepositoryImpl.swift
//  News
//
//  Created by Yosafat.H.S on 01/11/24.
//

import Foundation
import RxSwift

class NewsRepositoryImpl: NewsRepository{
    
    private let newsDataSource: NewsDataSource
    
    init(newsDataSource: NewsDataSource) {
        self.newsDataSource = newsDataSource
    }
    
    func fetchHeadlineNews() -> RxSwift.Observable<NewsModel> {
        return newsDataSource.fetchTopHeadlines()
    }
    
    
}
