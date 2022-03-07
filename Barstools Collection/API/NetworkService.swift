//
//  NetworkService.swift
//  Barstools Collection
//
//  Created by David Lee on 1/5/22.
//

import Foundation

/// NetworkError
///
/// Custom errors for network requests
enum NetworkError: Error {
    case invalidURL
    case failToParseJSON
    case genericError
}

/// NetworkService
///
/// Handles performing URL request for any given URL.
/// Then decodes the retrieved data to some generic decodable type.
class NetworkService {
    
    /// performRequest
    ///
    /// Makes a url request with the provided url then decodes the retrieve data to some generic decodable type.
    /// The user can pass in closures to handle both the completion and error cases.
    func performRequest<T: Decodable>(with urlString: String, _ type: T.Type, onCompletion: @escaping (T) -> Void, onError: @escaping (Error) -> Void) {
        
        guard let url = URL(string: urlString) else {
            onError(NetworkError.invalidURL)
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { [weak self] data, response, error in
            if let error = error {
                onError(error)
                return
            }
            
            // Check to see if some data was retrieved then attempt to parse the JSON into some generic decodable type
            guard let safeData = data, let result: T = self?.parseJSON(safeData) else {
                onError(NetworkError.failToParseJSON)
                return
            }
            
            onCompletion(result)
        }
        
        task.resume()
    }
        
    /// parseJSON
    ///
    /// Attempts to parse JSON data to some generic decodable type.
    private func parseJSON<T: Decodable>(_ data: Data) -> T? {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
}
