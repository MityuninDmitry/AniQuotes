//
//  ContentView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/10/23.
//

import SwiftUI
import AnimeQuotesNetwork

struct ContentView: View {
    @StateObject var quotes: Quotes = .init()
    var body: some View {
        VStack {
            List(quotes.quotes, id: \.self) { quote in
                QuoteView(quote: quote)
            }
            .listStyle(.plain)
            
            Button {
                //quotes.random()
                quotes.randomQuote()
            } label: {
                Text("Print random quotes")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
