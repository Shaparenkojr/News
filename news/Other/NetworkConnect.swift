

import Foundation
import Combine

enum TypeOfSortRequest: String {
    case noSort = ""
    case byPublishedData = "publishedAt"
    case byPopularity = "popularity"
}

private enum NetworkErrors: Error {
    case error
}

 class NetworkConnect {
    
    private let url = "https://newsapi.org/v2/everything?q="
    
    func getDataByWord(_ keyWord: String) -> AnyPublisher<ArticlesModel, Error> {
        guard let url = URL(string: "\(url)\(keyWord)") else {
            return Fail(error: NetworkErrors.error)
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = ["X-Api-Key": "4f2322d318b247c9ac6b29fcd4b9a035"]
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: ArticlesModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getDataBySort(_ keyWord: String,_ type: TypeOfSortRequest) -> AnyPublisher<ArticlesModel, Error> {
        guard let url = URL(string: "\(url)\(keyWord)&sortBy=\(type.rawValue)") else {
            return Fail(error: NetworkErrors.error)
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = ["X-Api-Key": "4f2322d318b247c9ac6b29fcd4b9a035"]
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: ArticlesModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
