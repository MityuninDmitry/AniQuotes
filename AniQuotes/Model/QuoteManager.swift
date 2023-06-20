//
//  Quotes.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/11/23.
//

import Foundation
import AnimeQuotesNetwork
import WaifuPicsNetwork

class QuoteManager: ObservableObject {
    static var shared = QuoteManager()
    
    
    @Published var currentQuote: QuoteWrapper?
    var currentQuoteIndex: Int?
    {
        didSet {
            if currentQuoteIndex != nil {
                
                if currentQuoteIndex! <= quotes.count - 1 {
                    currentQuote = quotes[currentQuoteIndex!]
                }
                
            }
            
        }
    }
    @Published var quotes: [QuoteWrapper] = []
    @Published var favoriteQuotes: [QuoteWrapper] = []
    
    
    private init() {
        quotes = .init()
        favoriteQuotes = .init()
        currentQuoteIndex = nil
    }
    func nextQuote(imageCategory: SwfCategory) {
        if currentQuoteIndex == nil {
            uploadQuote(imageCategory: imageCategory)
        }
        else {
            if currentQuoteIndex! == self.quotes.count - 1 {
                uploadQuote(imageCategory: imageCategory)
            } else {
                nextCurrentQuoteIndex()
            }
        }
    }
    func uploadQuote(imageCategory: SwfCategory) {
        let quoteWrapper: QuoteWrapper = .init(id: 0.0, action: self.nextCurrentQuoteIndex)
        quoteWrapper.imageCategory = imageCategory
        quoteWrapper.randomQuote()
        quotes.append(quoteWrapper)
    }
    func previousCurrentQuoteIndex() {
        if currentQuoteIndex != nil {
            if currentQuoteIndex! != 0 {
                currentQuoteIndex! -= 1
            }
        }
    }
    
    func nextCurrentQuoteIndex() {
        if self.currentQuoteIndex == nil {
            self.currentQuoteIndex = 0
        } else {
            self.currentQuoteIndex! += 1
        }
    }
    func appendToFavoriteQuotes(quote: QuoteWrapper) {
        self.favoriteQuotes.append(quote)
    }
    
    func removeFavorite(quote: QuoteWrapper) {
        var index = 0
        var isFound = false
        for favoriteQuote in favoriteQuotes {
            
            if quote.quote!.key == favoriteQuote.quote!.key {
                isFound = true
                break
            }
            index += 1
        }
        
        if isFound {
            self.favoriteQuotes.remove(at: index)
        }
        
    }
    
    func isFavorite(quote: QuoteWrapper) -> Bool {
        for favoriteQuote in favoriteQuotes {
            if favoriteQuote.quote!.key == quote.quote!.key {
                return true
            }
        }
        return false
    }
    
    func clearQuotes() {
        self.quotes = []
    }
    
}
