//
//  QuoteTextView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/20/23.
//

import SwiftUI
import AnimeQuotesNetwork

struct QuoteTextView: View {
    @EnvironmentObject var quote: QuoteViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .padding(.horizontal, 40)
                .opacity(0.5)
            
            VStack(alignment: .leading) {
                
                Text(quote.quote.quote)
                    .fixedSize(horizontal: false, vertical: true)
                
                HStack {
                    Spacer()
                    Text(quote.quote.character)
                }
                
                
                HStack {
                    Spacer()
                    Text(quote.quote.anime)
                }
            }
            .padding(.horizontal, 50)
            
        }
        .scaledToFit()
        
    }
}

struct QuoteTextView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteTextView()
        .environmentObject(QuoteManager.shared)
    }
}
