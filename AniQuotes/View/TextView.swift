//
//  QuoteTextView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/20/23.
//

import SwiftUI
import AnimeQuotesNetwork

struct TextView: View {
    @EnvironmentObject var quote: QuoteViewModel
    
    var body: some View {
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
        .cornerRadius(10)
        .padding(.horizontal, 10)
        .background {
            Color.white.opacity(0.9)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
        
        
    }
}

struct QuoteTextView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
            .environmentObject(QuoteViewModel(quote: Quote(key: 0.2, anime: "FDf", character: "asdas", quote: "dfsdf", v: 0.1)))
        TextView()
            .environmentObject(QuoteViewModel(quote: Quote(key: 0.1, anime: "anime", character: "character", quote: "long quote text slkdfj lsdjf lsjdf lsdflk nsldkf slkdjf lksjdfl sjdflk jsdlf jslkdfj lsdjf lsjdflk jsdlfk slkdfn ksdnfksdflk nsdlfm sidfj lkfms dlkfm sldjflksm lkfmsdlk mfslkdmf lksdmf lsijdfl ksdflk smdflks iodfjmslk mdflong quote text slkdfj lsdjf lsjdf lsdflk nsldkf slkdjf lksjdfl sjdflk jsdlf jslkdfj lsdjf lsjdflk jsdlfk slkdfn ksdnfksdflk nsdlfm sidfj lkfms dlkfm sldjflksm lkfmsdlk mfslkdmf lksdmf lsijdfl ksdflk smdflks iodfjmslk mdflong quote text slkdfj lsdjf lsjdf lsdflk nsldkf slkdjf lksjdfl sjdflk jsdlf jslkdfj lsdjf lsjdflk jsdlfk slkdfn ksdnfksdflk nsdlfm sidfj lkfms dlkfm sldjflksm lkfmsdlk mfslkdmf lksdmf lsijdfl ksdflk smdflks iodfjmslk mdflong quote text slkdfj lsdjf lsjdf lsdflk nsldkf slkdjf lksjdfl sjdflk jsdlf jslkdfj lsdjf lsjdflk jsdlfk slkdfn ksdnfksdflk nsdlfm sidfj lkfms dlkfm sldjflksm lkfmsdlk mfslkdmf lksdmf lsijdfl ksdflk smdflks iodfjmslk mdflong quote text slkdfj lsdjf lsjdf lsdflk nsldkf slkdjf lksjdfl sjdflk jsdlf jslkdfj lsdjf lsjdflk jsdlfk slkdfn ksdnfksdflk nsdlfm sidfj lkfms dlkfm sldjflksm lkfmsdlk mfslkdmf lksdmf lsijdfl ksdflk smdflks iodfjmslk mdf", v: 0.2)))
    }
}
