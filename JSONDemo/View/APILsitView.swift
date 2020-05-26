//
//  APILsitView.swift
//  JSONDemo
//
//  Created by Mark Chen on 2020/5/20.
//  Copyright © 2020 Mark Chen. All rights reserved.
//

import SwiftUI
import Combine

struct Result: Codable, Identifiable {
    let id: Int
    var title: String
    var thumbnailUrl: URL
}

struct APIList: View {
    
    @State private var results = [Result]()
    
    var body: some View {
        
        ScrollView(.vertical) {
            Divider()
            GridView(rows: results.count/4, columns: 4) { row, col in
                NavigationLink(destination: DetailView(information: self.results[4*row+col])) {
                    Cell(self.results[4*row+col])
                }.buttonStyle(PlainButtonStyle())
            }
        }
            
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, reponse, error in
            
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode([Result].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.results = Array(decodedResponse[0..<80])
                        
                    }
                    
                    return
                } catch {
                    print(error)
                }
            }
            print("fetching error: \(error?.localizedDescription ?? "Unkown error")")
        }.resume()
        
    }
}



struct Cell: View {
    let result: Result
    
    var body: some View {
        ZStack {
            URLImage(url: result.thumbnailUrl)
            VStack {
                Text(String(result.id))
                Spacer()
                Text(result.title).font(.system(size: 15)).frame(height: 50)
            }.padding(10)
        }
    }
    
    init(_ result: Result) {
        self.result = result
    }
}
