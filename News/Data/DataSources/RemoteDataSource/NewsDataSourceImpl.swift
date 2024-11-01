//
//  NewsDataSourceImpl.swift
//  News
//
//  Created by Yosafat.H.S on 01/11/24.
//

import Foundation
import RxSwift
import Alamofire
import SwiftyJSON

class NewsDataSourceImpl : NewsDataSource {
    
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    private let apiKey = "YOUR_API_KEY"
    
    func fetchTopHeadlines() -> Observable<NewsModel> {
        return Observable.create { observer in
            let parameters: [String: Any] = [
                "country": "us",
                "apiKey": "311be9f9ab43422f8a387238a8ec3092"
            ]
            
            let request = AF.request(self.baseURL, parameters: parameters).responseData { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    if let news = NewsMapper.map(from: json){
                        observer.onNext(news)
                        observer.onCompleted()
                    } else {
                        observer.onError(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Parsing error"]))
                    }
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
    
    
}
