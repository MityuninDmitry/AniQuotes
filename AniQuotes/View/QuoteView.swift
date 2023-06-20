//
//  QuoteView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/11/23.
//

import SwiftUI
import AnimeQuotesNetwork

struct QuoteView: View {
    @EnvironmentObject var quoteManager: QuoteManager
    var quote: QuoteWrapper
    @State var isFavorite: Bool = false
    
    var body: some View {
        if quote.isUploadedFully {
            ZStack {
                QuoteImageView(quote: self.quote)
                
                VStack {
                    Spacer()
                    QuoteTextView(quote: self.quote)
                }
                
                FavoriteView(quote: quote, isFavorite: $isFavorite)
 
            }
            .onTapGesture(count: 2) {
                self.isFavorite = quoteManager.isFavorite(quote: self.quote)
                if isFavorite {
                    quoteManager.removeFavorite(quote: self.quote)
                } else {
                    quoteManager.appendToFavoriteQuotes(quote: self.quote)
                }
                withAnimation(.easeInOut(duration: 0.3)) {
                    isFavorite.toggle()
                }
                
                
            }
        } else {
            ProgressView()
        }
        
        
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        
        QuoteView(
            quote: QuoteWrapper(id: 0, quote: Quote(key: 1, anime: "NameANIME", character: "Saitama", quote: "Something sdasd,mansd,n sdfk sjd,f s,dmfn s,dfn s,mdfn,smdnf ,smdnf ,msdn f,msdnf ,msndf,msnd,fmn ", v: 1.1), imageURL: "https://i.waifu.pics/RBGn36s.jpeg", action: {print("hello")}))
        .environmentObject(QuoteManager.shared)
    }
}
