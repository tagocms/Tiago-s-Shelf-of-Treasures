//
//  ContentView.swift
//  TiagoTT
//
//  Created by Tiago Camargo Maciel dos Santos on 17/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("tiago")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    
                    NavigationLink {
                        Shelf()
                    } label: {
                        Image("TTT")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                    }
                    .accessibilityHint(Text("Go to the next screen."))
                    
                }
                .padding()
                
                VStack {
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
