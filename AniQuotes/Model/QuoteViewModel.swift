//
//  QuoteWrapper.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/13/23.
//

import Foundation
import AnimeQuotesNetwork
import WaifuPicsNetwork
import SwiftUI

class QuoteViewModel: ObservableObject, Identifiable, Hashable {
    
    var id: UUID = UUID()
    var quote: Quote
    var backgroundImage: ImageViewModel = .init()
    @Published var isFavorite: Bool = false
    
    
    static func == (lhs: QuoteViewModel, rhs: QuoteViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(quote: Quote) {
        self.quote = quote
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
