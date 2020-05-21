//
//  ContentView.swift
//  JSONDemo
//
//  Created by Mark Chen on 2020/5/20.
//  Copyright © 2020 Mark Chen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 100) {
                NavigationLink(destination: APIList()) {
                    Text("Request API")
                }
            }
            .navigationBarTitle("JSON Placeholder")
        }
        
    }
    
    func trigger() {
        
    }
}

//struct APIList: View {
//    var body: some View {
//        VStack {
//            HStack {
//                ForEach 0..<4 {
//                    Rectangle()
//                        .frame(height: 20)
//                }
//                
//            }
//        }
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
////        ContentView()
//        APIList()
//    }
//}
