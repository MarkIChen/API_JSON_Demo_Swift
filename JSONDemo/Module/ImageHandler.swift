//
//  ImageHandler.swift
//  JSONDemo
//
//  Created by Mark Chen on 2020/5/21.
//  Copyright © 2020 Mark Chen. All rights reserved.
//

import Combine
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map {UIImage(data: $0.data)}
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel(){
        cancellable?.cancel()
    }
}

struct URLImage: View {
    @ObservedObject private var imageLoader: ImageLoader
    let placeholder: Image
    
    init(url: URL, placeholder: Image = Image(systemName: "photo")) {
        self.placeholder = placeholder
        self.imageLoader = ImageLoader(url: url)
        
    }
    
    var body: some View {
        image
            .onAppear(perform: imageLoader.load)
            .onDisappear(perform: imageLoader.cancel)
    }
    
    private var image: some View {
        Group {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!).resizable()
            } else {
                placeholder
            }
        }
    }
}

