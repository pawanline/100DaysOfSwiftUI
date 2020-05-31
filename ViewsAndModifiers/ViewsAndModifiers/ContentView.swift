//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Pawan Kumar on 31/05/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    // Approach 2
//    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
//        self.rows = rows
//        self.columns = columns
//        self.content = content
//    }
   var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }
}


struct ContentView: View {
    var body: some View {
      GridStack(rows: 4, columns: 4) { row, col in
            HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
        
//        GridStack(rows: 4, columns: 4) { row, col in
//            Image(systemName: "\(row * 4 + col).circle")
//            Text("R\(row) C\(col)")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
