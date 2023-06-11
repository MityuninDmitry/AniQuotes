//
//  Quotes.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/11/23.
//

import Foundation
import AnimeQuotesNetwork

class QuoteManager: ObservableObject {
    static var shared = QuoteManager()
    
    @Published var quotes: [Quote] = []
    @Published var favoriteQuotes: [Quote] = []
    
    private init() {
        quotes = .init()
        favoriteQuotes = .init()
    }
    
    func randomQuote() {
        var isDevelopment = true
        if isDevelopment {
            self.quotes.append(
                Dict.quotes[Int.random(in: 0..<Dict.quotes.count)]
            )
        } else {
            AnimeQuotesAPI.randomQuote { data, error in
                if error != nil {
                    self.quotes.append(
                        Quote(
                            key: Double(self.quotes.count + 1),
                            anime: "One Piece",
                            character: "Nami",
                            quote: error!.localizedDescription,
                            v: 0.1)
                    )
                    return
                }
                if let safeData = data {
                    self.clearQuotes()
                    self.quotes.append(safeData)
                }
            }
        }
        
    }
    
    func appendToFavoriteQuotes(quote: Quote) {
        self.favoriteQuotes.append(quote)
    }
    
    func removeFavorite(quote: Quote) {
        var index = 0
        var isFound = false
        for favoriteQuote in favoriteQuotes {
            
            if quote.key == favoriteQuote.key {
                isFound = true
                break
            }
            index += 1
        }
        
        if isFound {
            self.favoriteQuotes.remove(at: index)
        }
        
    }
    
    func isFavorite(quote: Quote) -> Bool {
        for favoriteQuote in favoriteQuotes {
            if favoriteQuote.key == quote.key {
                return true
            }
        }
        return false
    }
    
    func clearQuotes() {
        self.quotes = []
    }
    
}
