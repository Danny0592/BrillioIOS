//
//  viewModel.swift
//  BrillioIos
//
//  Created by daniel ortiz millan on 16/04/24.
//

import Foundation
class QuotesViewModel: ObservableObject {
    
    @Published var quotesDetail: Titles?
    @Published var error: Error?
    

    let apiClient = ApiClient()
    
    func getDataQuotes() {
        apiClient.getQuotes { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let quotes):
                    self.quotesDetail = quotes
                    print("results \(String(describing: self.quotesDetail))")
                case .failure(let error):
                    print("Error fetching post: \(error)")
                    
                }
                
            }
        }
        
    }
}
