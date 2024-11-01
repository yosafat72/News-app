//
//  NewsDataSource.swift
//  News
//
//  Created by Yosafat.H.S on 01/11/24.
//

import Foundation
import RxSwift

protocol NewsDataSource {
    func fetchTopHeadlines() -> Observable<NewsModel>
}
