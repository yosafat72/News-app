//
//  NewsRepository.swift
//  News
//
//  Created by Yosafat.H.S on 01/11/24.
//

import Foundation
import RxSwift

protocol NewsRepository {
    func fetchHeadlineNews() -> Observable<NewsModel>
}
