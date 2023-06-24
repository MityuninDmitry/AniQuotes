//
//  NavigationButtonsView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/23/23.
//

import SwiftUI
import NavigationStackCustom

struct NavigationButtonsView: View {
    var body: some View {
        HStack {
            AppNavigationViewBack(destination: .previous) {
                NavigationButtonView(buttonText: "Go Back")
            }
            
            Spacer(minLength: 1)
            
            AppNavigationViewBack(destination: .root) {
                NavigationButtonView(buttonText: "To Root")
            }
        }
        .padding(.horizontal, 2)
        .padding(.vertical, 2)
        .background(.indigo)
        .clipShape(
            RoundedRectangle(cornerRadius: 5)
        )
        .frame(height: 40)
        
    }
}

struct NavigationButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtonsView()
    }
}
