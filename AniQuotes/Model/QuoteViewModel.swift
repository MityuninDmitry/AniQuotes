//
//  QuoteWrapper.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/13/23.
//

import Foundation
import AnimeQuotesNetwork
import WaifuPicsNetwork
import SwiftUI

class QuoteViewModel: ObservableObject, Identifiable, Hashable {
    
    var id: UUID = UUID()
    var quote: Quote
    var imageURL: String? = nil {
        didSet {
            if imageURL != nil {
                self.load(url: URL(string: self.imageURL!)!)
                print("IMAGE URL LOADED \(self.imageURL!)")
            }
            
        }
    }
    @Published var image: UIImage? {
        didSet {
            print("IMAGE LOADED")
        }
    }
    
    static func == (lhs: QuoteViewModel, rhs: QuoteViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    init(quote: Quote) {
        self.quote = quote
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func fetchImage() {
        let randomCategory = [SwfCategory.neko, SwfCategory.waifu].randomElement()!
        WaifuPictureAPI.getImageSource(swfCategory: randomCategory) { data, error in
            if error != nil {
                self.imageURL = "https://i.waifu.pics/HlZeFoe.png"
                //self.load(url: URL(string: self.imageURL!)!)
                return
            }
            
            if data != nil {
                self.imageURL = data!.url
                
            }
            
            
        }
    }
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
