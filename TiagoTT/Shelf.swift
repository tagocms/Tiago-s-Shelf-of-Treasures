//
//  Shelf.swift
//  TiagoTT
//
//  Created by Tiago Camargo Maciel dos Santos on 17/04/25.
//

import SwiftUI

struct Shelf: View {
    
    private(set) static var cartridges = Cartridges.allCases

    var body: some View {
        NavigationView {
            ZStack {
                Image("shelf")
                .resizable()
                .scaledToFit()
                .position(x: 196.5, y: 500)
                
                
                
                VStack(alignment: .leading, spacing: -610) {
                    Image("tiagoface")
                        .position(x: 50, y: 50)
                    
                    Text("What a mess! Can you help me organize the shelves with my RPG videogame cartridges, please? I need them to remember who I am.")
                        .font(.geoRegular(21))
                        .position(x: 240, y: 0)
                        .multilineTextAlignment(.leading)
                        .frame(minWidth: 200, idealWidth: 300, maxWidth: 300, minHeight: 10, idealHeight: 20, maxHeight: .infinity, alignment: .topLeading)
                    
                    Image("plant")
                        .position(x: 320, y: 580)
                    
                }
                
                
                ForEach(0..<Shelf.cartridges.count - 1, id: \.self) {i in
                    Cartridge(idCartridge: Shelf.cartridges[i])
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

#Preview {
    Shelf()
}
