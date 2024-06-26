//
//  NetworkManager.swift
//  UIKitTestApp
//
//  Created by Александр Коробицын on 06.06.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL, noData, decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchData<T: Decodable>(request: BaseRequest, responseType: T.Type) async throws -> T {
        
        let request = try request.asURLRequest()
        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.noData
        }
    }
    
    func fetchImage(url: String) async throws -> Data {
        
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        //MARK: CacheSearch
        if let cacheData = StorageManager.shared.getCahedImage(url: url) {
            return cacheData
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // MARK: - SetCache
        StorageManager.shared.setCashedImage(data: data, responce: response)
        
        return data
    }
}
