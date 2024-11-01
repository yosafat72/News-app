//
//  HomeScreenViewModel.swift
//  News
//
//  Created by Yosafat.H.S on 01/11/24.
//

import Foundation
import RxSwift
import RxCocoa

class HomeScreenViewModel{
    private let fetchHeadlineUsecase: FetchHeadlineNewsUseCase
    private let disposeBag = DisposeBag()
    
    struct Output {
        let data: Driver<NewsModel>
        let errorMessage: Driver<String>
    }
    
    let output: Output
    
    init(fetchHeadlineUsecase: FetchHeadlineNewsUseCase) {
        self.fetchHeadlineUsecase = fetchHeadlineUsecase
        
        let result = fetchHeadlineUsecase.execute()
            .asDriver{ error in
                return .just(NewsModel(status: error.localizedDescription, totalResults: 0, articles: []))
            }
        
        self.output = Output(
            data: result,
            errorMessage: result
                .compactMap{ news -> String? in
                    return news.status == "Error" ? "Failed to load headline news data" : nil
                }
                .asDriver(onErrorJustReturn: "Unknown error")
        )
    }
}
