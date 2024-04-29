//
//  ContentView.swift
//  RemoteConfig
//
//  Created by Jungman Bae on 4/29/24.
//

import SwiftUI
import Firebase
import FirebaseRemoteConfigSwift

class RemoteConfiguration {
    private var remoteConfig = Firebase.RemoteConfig.remoteConfig()
}

struct ContentView: View {
    private var config = RemoteConfiguration()
    @RemoteConfigProperty(key: "screenType", fallback: nil) var screenType: String?
    
    private var image: (name: String, color: Color) {
        if screenType == "screenA" {
            ("a.square", .green)
        } else if screenType == "screenB" {
            ("b.square", .blue)
        } else {
            ("questionmark.square", .red)
        }
    }
    
    var body: some View {
        VStack {
            if screenType != nil {
                Image(systemName: image.name)
                    .foregroundStyle(image.color)
                    .font(.system(size: 250))
            } else {
                ProgressView()
                    .controlSize(.large)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
