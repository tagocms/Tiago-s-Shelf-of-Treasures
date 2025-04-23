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
        GeometryReader { g in
            
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
                    
                    
                    ForEach(0..<Shelf.cartridges.count - 1, id: \.self) { i in
                        let x = limitedX()
                        let y = limitedY()
                        Cartridge(idCartridge: Shelf.cartridges[i], screenSize: g.size, originX: x, originY: y)
                            .position(x: x, y: y)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
        
    }
    
    private func limitedX() -> CGFloat {
            let minX: CGFloat = 50 // mínimo limite
            let maxX: CGFloat = UIScreen.main.bounds.width - 150 // máximo limite
            return CGFloat.random(in: minX...maxX)
        }
        
    private func limitedY() -> CGFloat {
        let minY: CGFloat = 600 // limite superior
        let maxY: CGFloat = UIScreen.main.bounds.height - 150 // limite inferior
        return CGFloat.random(in: minY...maxY)
    }
}

#Preview {
    Shelf()
}
