//
//  FavoriteView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/20/23.
//

import SwiftUI
import AnimeQuotesNetwork

struct FavoriteView: View {
    @EnvironmentObject var quoteManager: QuoteManager
    var quote: QuoteWrapper
    var scale: Double = 2
    @Binding var isFavorite: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                if isFavorite {
                    Image.init(systemName: "heart.fill")
                        .foregroundColor(.red)
                        .scaleEffect(self.scale)
                        .overlay {
                            Image.init(systemName: "heart")
                                .scaleEffect(self.scale)
                        }
                } else {
                    Image.init(systemName: "heart")
                        .scaleEffect(self.scale)
                        
                }
            }
            Spacer()
        }
        .padding()
        
        
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(
            quote: QuoteWrapper(id: 0, quote: Quote(key: 1, anime: "NameANIME", character: "Saitama", quote: "Something sdasd,mansd,n sdfk sjd,f s,dmfn s,dfn s,mdfn,smdnf ,smdnf ,msdn f,msdnf ,msndf,msnd,fmn ", v: 1.1), imageURL: "https://i.waifu.pics/RBGn36s.jpeg", action: {print("hello")}),
            isFavorite: .constant(true))
        .environmentObject(QuoteManager.shared)
    }
}
