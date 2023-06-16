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
    
    var body: some View {
        ZStack {
            if quote.image != nil {
                GeometryReader { reader in
                    Image(uiImage: quote.image!)
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.top)
                        .frame(width: reader.size.width, alignment: .center)
                }
                
            }
            
            
            
            VStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                        .opacity(0.5)
                    
                    VStack(alignment: .leading) {
                        
                        Text(quote.quote!.quote)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        HStack {
                            Spacer()
                            Text(quote.quote!.character)
                        }
                        
                        
                        HStack {
                            Spacer()
                            Text(quote.quote!.anime)
                        }
                        
                        
                        HStack {
                            Spacer()
                            
                            if quoteManager.isFavorite(quote: self.quote) {
                                Button {
                                    quoteManager.removeFavorite(quote: self.quote)
                                } label: {
                                    Image.init(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 25))
                                }
                                
                            } else {
                                Button {
                                    quoteManager.appendToFavoriteQuotes(quote: self.quote)
                                } label: {
                                    Image.init(systemName: "star")
                                        .foregroundColor(.black)
                                        .font(.system(size: 25))
                                }
                            }
                            
                            
                        }
                    }
                    .padding(.horizontal, 50)
                    
                }
                .scaledToFit()
            }
            
            
            
            
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
