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

class QuoteWrapper: ObservableObject {

    var id: Double = 0.0
    var action: ()->Void // действие для апдейта индекса менеджера
    var quote: Quote? = nil {
        didSet {
            if self.quote != nil {
                self.id = self.quote!.key
            }
        }
    }
    var imageURL: String? = nil
    var image: UIImage?
    
    init(id: Double, quote: Quote? = nil, imageURL: String? = nil, action: @escaping () -> Void) {
        self.id = id
        self.quote = quote
        self.imageURL = imageURL
        
        self.action = action
    }
    func runAction() {
        if quote != nil && image != nil {
            action()
        }
        
    }
    func searchNextImageUrl() {
        var category: SwfCategory = .waifu
        let randomizer = Int.random(in: 0...1)
        if randomizer == 1 {
            category = .neko
        }
        WaifuPictureAPI.getImageSource(swfCategory: category) { data, error in
            if error != nil {
                self.imageURL = "https://i.waifu.pics/HlZeFoe.png"
                self.load(url: URL(string: self.imageURL!)!)
                return
            }
            
            if data != nil {
                self.imageURL = data!.url
                self.load(url: URL(string: self.imageURL!)!)
            }
            
            
        }
    }
    func searchRandomQuote() {
        let isDevelopment = false
        if isDevelopment {
            self.quote = Dict.quotes[Int.random(in: 0..<Dict.quotes.count)]
            self.runAction()
        } else {
            AnimeQuotesAPI.randomQuote { data, error in
                if error != nil {
                    self.quote = Quote(
                        key: 1,
                        anime: "Error",
                        character: "Error",
                        quote: error!.localizedDescription,
                        v: 0.1)
                    self.runAction()
                    return
                }
                if let safeData = data {
                    self.quote = safeData
                    self.runAction()
                }
            }
        }
    }
    func randomQuote() {
        self.searchRandomQuote()
        self.searchNextImageUrl()
    }
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        self!.runAction()
                    }
                }
            }
        }
    }
}
