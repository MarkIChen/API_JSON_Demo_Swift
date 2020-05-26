//
//  GridView.swift
//  JSONDemo
//
//  Created by Mark Chen on 2020/5/20.
//  Copyright © 2020 Mark Chen. All rights reserved.
//

import SwiftUI

struct GridView<Content: View>: View {
    
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
    
            VStack(spacing: 0) {
                ForEach(0..<rows, id:\.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<self.columns, id: \.self) { columns in
                            self.content(row, columns)
                                .frame(maxWidth: .infinity)
                                .frame(height: 100)
                                .padding(0)
                        }
                    }
                    
                }
                Spacer()
            }
        
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        GridView(rows: 30, columns: 4) { row, col in
            Rectangle().background(Color.orange)
            
        }
    }
}

