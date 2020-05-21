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
    
    var body: some View {
        Text(displayResult.title)
    }
    
    init(information: Result) {
        self.displayResult = information
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(information: Result(id: 1,
                                       title: "testing",
                                       thumbnailUrl: (URL(string: "https://via.placeholder.com/150/92c952") ?? nil)!))
    }
}
