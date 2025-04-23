//
//  ContentView.swift
//  TiagoTT
//
//  Created by Tiago Camargo Maciel dos Santos on 17/04/25.
//

import SwiftUI

struct ContentView: View {
    @State private var scaled: Bool = false
    
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
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.tint)
                            .scaleEffect(scaled ? 1.2 : 1.0)
                            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: scaled)
                            .onAppear {
                                scaled.toggle()
                            }
                            .frame(width: 300, height: 100)
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
