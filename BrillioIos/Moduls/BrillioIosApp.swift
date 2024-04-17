//
//  BrillioIosApp.swift
//  BrillioIos
//
//  Created by daniel ortiz millan on 16/04/24.
//

import SwiftUI

struct QuotesView: View {
    @StateObject var viewModel = QuotesViewModel()
    
    var body: some View {
        VStack {
            if let quote = viewModel.quotesDetail {
                VStack(alignment: .leading) {
                    Text("Author: \(quote.author)")
                        .font(.headline)
                    Text("Content: \(quote.content)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                
                Button(action: {
                    
                    viewModel.getDataQuotes()
                    
                }) {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .resizable()
                            .frame(width: 50, height: 50)
                }
                
            } else if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
                    .foregroundColor(.red)
            } else {
                ProgressView()
            }
            
        }
        .onAppear {
            viewModel.getDataQuotes()
        }
    }
}

