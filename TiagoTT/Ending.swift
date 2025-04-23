//
//  Ending.swift
//  TiagoTT
//
//  Created by Tiago Camargo Maciel dos Santos on 23/04/25.
//

import SwiftUI

struct Ending: View {
    @State private var scaled: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("tiago")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    
                }
                .padding()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

#Preview {
    Ending()
}
