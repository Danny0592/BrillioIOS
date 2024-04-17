//
//  ApiClient.swift
//  BrillioIos
//
//  Created by daniel ortiz millan on 16/04/24.
//

import Foundation

class ApiClient {
    
    func getQuotes(completion: @escaping (Result<Titles, Error>) -> Void) {
        
        var request = URLRequest(url: URL(string: "https://api.quotable.io/random")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
            
            do {
                let result = try JSONDecoder().decode(Titles.self, from: data)
                completion(.success(result))
            } catch {
                print("Error decoding JSON: \(error)")
                completion(.failure(error))
            }
            
        }.resume()
            
        
    }
}
