//
//  AnimePickerView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/22/23.
//

import SwiftUI

struct AnimePickerView: View {
    @EnvironmentObject var quoteManager: QuoteManager
    var animeTitles: [AnimeTitle] =  [.Naruto, .Ippo]
    @State var selectedAnimeTitle: AnimeTitle = .Naruto 
    
    var body: some View {
        Picker("Choose image category", selection: $selectedAnimeTitle) {
            ForEach(animeTitles, id: \.self) { anime in
                Text("\(anime.rawValue)")
            }
        }
        .pickerStyle(.segmented)
        .onChange(of: selectedAnimeTitle, perform: { newValue in
            quoteManager.animeTitle = newValue
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
