//
//  QuoteCellView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/24/23.
//

import SwiftUI
import AnimeQuotesNetwork

struct QuoteCellView: View {
    @EnvironmentObject var quoteManager: QuoteManager
    @EnvironmentObject var quote: QuoteViewModel
    @State var isFavorite: Bool = false
    var index: Int
    
    var body: some View {
            HStack {
                ZStack {
                    Text("\(index). \(quote.quote.anime): \(quote.quote.character)")
                    
                    // показываем поверх такую же инфу, когда не в избранном. Но если поменяли на измбранное, то вьюха исчезает по transition
                    if !isFavorite && quote.isFavorite {
                        Text("\(index). \(quote.quote.anime): \(quote.quote.character)")
                            .transition(.moveTrailingBottom)
                            
                            
                    }
                }
                
                Spacer()
                
                HeartView()
                    .environmentObject(quoteManager)
                    .environmentObject(quote)
            }
            .onChange(of: quote.isFavorite, perform: { newValue in
                if newValue {
                    // меняем с анимацией, когда цитата попала в избранное
                    withAnimation(.easeInOut(duration: 1)) {
                        self.isFavorite = newValue
                    }
                } else {
                    // меняем без анимации, когда убрали из избранного
                    self.isFavorite = newValue
                }
            })
    }
}

struct QuoteCellView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteCellView(index: 1)
            .environmentObject(QuoteManager.shared)
            .environmentObject(QuoteViewModel(quote: Quote(key: 0.2, anime: "FDf", character: "asdas", quote: "dfsdf", v: 0.1)))
    }
}
