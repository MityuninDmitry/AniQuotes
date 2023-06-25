//
//  ImageViewModel.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/25/23.
//

import Foundation
import SwiftUI
import WaifuPicsNetwork

class ImageViewModel: ObservableObject, Identifiable {
    
    var id: UUID = UUID()
    var urlString: String? = nil {
        didSet {
            if urlString != nil {
                self.load(url: URL(string: self.urlString!)!)
            }
            
        }
    }
    @Published var image: UIImage?
    
    func fetchImage() {
        let randomCategory = [SwfCategory.neko, SwfCategory.waifu].randomElement()!
        WaifuPictureAPI.getImageSource(swfCategory: randomCategory) { data, error in
            if error != nil {
                self.urlString = "https://i.waifu.pics/HlZeFoe.png"
                //self.load(url: URL(string: self.imageURL!)!)
                return
            }
            
            if data != nil {
                self.urlString = data!.url
                
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
