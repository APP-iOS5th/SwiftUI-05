//
//  ContentView.swift
//  ScrollViewReaders
//
//  Created by Jungman Bae on 4/25/24.
//

import SwiftUI


struct ContentView: View {
    @State private var scrolledID: CharacterInfo.ID?

    var body: some View {
        HStack(spacing: 20) {
            VStack {
                Text("iOS 17+")
                    .foregroundStyle(.blue)
                    .font(.title)
                ScrollView {
                    Button("Go to letter Q") {
                        scrolledID = 16
                    }
                    .padding()
                    .background(.blue)
                    .tint(.yellow)
                    
                    ForEach(CharacterInfo.charArray) { image in
                        Image(systemName: image.name)
                            .font(.largeTitle)
                            .foregroundStyle(.blue)
                            .frame(width: 90, height: 90)
                            .background(.yellow)
                            .padding()
                    }
                    
                    Button("Go to letter G") {
                        withAnimation {
                            scrolledID = 6
                        }
                    }
                    .padding()
                    .background(.blue)
                    .tint(.yellow)
                }
                .scrollPosition(id: $scrolledID)
            }
            VStack {
                Text("iOS 14+")
                    .foregroundStyle(.blue)
                    .font(.title)
                ScrollView {
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
