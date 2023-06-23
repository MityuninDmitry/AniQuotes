//
//  AnimePickerView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/22/23.
//

import SwiftUI

struct AnimePickerView: View {
    @EnvironmentObject var quoteManager: QuoteManager
    var animeTitles: [String] =  ["", ""]
    @State var selectedAnimeTitle: String = "Naruto"
    
    var body: some View {
        Picker("Choose image category", selection: $selectedAnimeTitle) {
            ForEach(animeTitles, id: \.self) { anime in
                Text("\(anime)")
            }
        }
        .pickerStyle(.segmented)
        .onChange(of: selectedAnimeTitle, perform: { newValue in
            quoteManager.textForSearching = newValue
        })
        .onAppear {
            UISegmentedControl.appearance().backgroundColor = .systemIndigo
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.lightGray], for: .normal)
                UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        }
        .shadow(radius: 3)
    }
}

struct AnimePickerView_Previews: PreviewProvider {
    static var previews: some View {
        AnimePickerView()
            .environmentObject(QuoteManager.shared)
    }
}
