//
//  VerticalButtonView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/12/23.
//

import SwiftUI
import WaifuPicsNetwork

struct VerticalButtonView: View {
    @State var isTapped: Bool = false
    var width: Double
    var action: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
        .frame(width: width)
        .contentShape(RoundedRectangle(cornerRadius: 10))
        .edgesIgnoringSafeArea(.top)
        .opacity(isTapped ? 0.1 : 0.001)
        .onTapGesture {
            isTapped = true
            withAnimation(.easeInOut(duration: 1)) {
                isTapped = false
            }
            action()
        }
        
    }
}

struct VerticalButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalButtonView(
            width: 50,
            action: {})
            .environmentObject(QuoteManager.shared)
    }
}
