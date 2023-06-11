//
//  Quotes.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/11/23.
//

import Foundation
import AnimeQuotesNetwork

class Quotes: ObservableObject {
    
    @Published var quotes: [Quote]
    
    init() {
        quotes = .init()
    }
    
    func random() {
        AnimeQuotesAPI.randomQuotes { data, error in
            self.quotes = data!
            print(self.quotes)
            for quote in self.quotes {
                print(quote.quote)
            }
            
        }
    }
    
    func randomQuote() {
        AnimeQuotesAPI.randomQuote { data, error in
            if let safeData = data {
                self.clearQuotes()
                self.quotes.append(safeData)
            }
        }
    }
    
    func clearQuotes() {
        self.quotes = []
    }
    
}
