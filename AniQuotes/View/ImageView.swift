//
//  ImageView.swift
//  AniQuotes
//
//  Created by Dmitry Mityunin on 6/25/23.
//

import SwiftUI

struct ImageView: View {
    @EnvironmentObject var imageVM: ImageViewModel
    
    var body: some View {
        VStack {
            if imageVM.image != nil {
                GeometryReader { reader in
                    Image(uiImage: imageVM.image!)
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.top)
                        .frame(width: reader.size.width, alignment: .center)
                }
                
                
            } else {
                ProgressView()
                    
            }
        }
        .onAppear {
            if imageVM.image == nil {
                imageVM.fetchImage()
            }
        }
       
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
            .environmentObject(ImageViewModel())
    }
}
