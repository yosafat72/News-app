//
//  FetchHeadlineNewsUseCase.swift
//  News
//
//  Created by Yosafat.H.S on 01/11/24.
//

import Foundation
import RxSwift

class FetchHeadlineNewsUseCase{
    
    private let repository: NewsRepository
    
    init(repository: NewsRepository) {
        self.repository = repository
    }
    
    func execute() -> Observable<NewsModel>{
        return repository.fetchHeadlineNews()
    }
    
}
