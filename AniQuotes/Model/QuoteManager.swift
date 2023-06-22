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
    
    @Published var quotes: [QuoteViewModel] = []
    @Published var favoriteQuotes: [QuoteViewModel] = []
    @Published var isLoading: Bool = false
    @Published var animeTitle: AnimeTitle = .Naruto {
        didSet {
            page = 1
            quotes = .init()
            isLoadedFully = false
            fetch()
        }
    }
    @Published var isLoadedFully = false
    private var page: Int = 1
    
    
    private init() {
        quotes = .init()
        favoriteQuotes = .init()
        
    }
    func fetch() {
        
        if self.isLoadedFully { // если загружен список полностью, то выходи
            return
        }
        self.isLoading = true // ставим, что в процессе загрузки
//        AnimeQuotesAPI.animeArray { data, error in
//            print(data)
//        }
        // вытягиваем список цитат
        AnimeQuotesAPI.randomQuotesByAnime(title: self.animeTitle.rawValue, page: page, completion: { [self] data, error in
            if error == nil {
                if data != nil {
                    self.quotes.append(contentsOf: data!.map({ quote in
                        return QuoteViewModel(quote: quote)
                    }))
                    self.page += 1
                    self.isLoading = false
                }
            } else {
                self.quotes.append(contentsOf: Dict.quotes.map({ quote in
                    return QuoteViewModel(quote: quote)
                }))
                self.isLoading = false
                self.isLoadedFully = true
                
                print(error!)
            }
            
        })
    }
    
    
    func appendToFavoriteQuotes(quote: QuoteViewModel) {
        self.favoriteQuotes.append(quote)
    }
    
    func removeFavorite(quote: QuoteViewModel) {
        var index = 0
        var isFound = false
        for favoriteQuote in favoriteQuotes {
            
            if quote.id == favoriteQuote.id {
                isFound = true
                break
            }
            index += 1
        }
        
        if isFound {
            self.favoriteQuotes.remove(at: index)
        }
        
    }
    
    func clearQuotes() {
        self.quotes = []
    }
    
}
