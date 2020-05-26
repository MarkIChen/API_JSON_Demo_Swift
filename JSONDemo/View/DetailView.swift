//
//  DetailView.swift
//  JSONDemo
//
//  Created by Mark Chen on 2020/5/21.
//  Copyright © 2020 Mark Chen. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let displayResult: Result
    
    var image: URLImage
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                self.image
                    .frame(maxWidth: .infinity)
                    .frame(height: 400)
                Divider()
                Text("id: \(displayResult.id)")
                Divider()
                Text("title: \(displayResult.title)")
                
                Spacer()
            }.padding(10)
        }
    }
    
    init(information: Result) {
        self.displayResult = information
        image = URLImage(url: displayResult.thumbnailUrl)
    }
    
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(information: Result(id: 1,
                                       title: "testing",
                                       thumbnailUrl: (URL(string: "https://via.placeholder.com/150/92c952") ?? nil)!))
    }
}
