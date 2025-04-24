//
//  Shelf.swift
//  TiagoTT
//
//  Created by Tiago Camargo Maciel dos Santos on 17/04/25.
//

import SwiftUI

struct Shelf: View {
    
    //Variável que somente ficará disponível após o jogador ter colocado pelo menos uma
    //fita no lugar
    @State private var showEndingLink = false
    @State private var cartridgesPlaced = [Cartridges]()
    
    @State private var scaledButton: Bool = false
    @State private var scaledText: Bool = false
    
    private(set) static var cartridges = Cartridges.allCases
    private let destinations: [(width: CGFloat, height: CGFloat)] = [
        (80, 220),
        (195, 220),
        (310, 220),
        (80, 300),
        (195, 300),
        (310, 300),
        (80, 385),
        (195, 385),
        (310, 385),
        (80, 465),
    ]

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
                            .shadow(radius: 10)
                        
                    }
                    
                    
                    ForEach(0..<Shelf.cartridges.count - 1, id: \.self) { i in
                        let x = limitedX()
                        let y = limitedY()
                        Cartridge(
                            idCartridge: Shelf.cartridges[i],
                            screenSize: g.size,
                            originX: x,
                            originY: y,
                            xDestination: destinations[i].width,
                            yDestination: destinations[i].height
                        )
                        .position(x: x, y: y)
                    }
                    
                    // Condicional para mostrar o NavigationLink
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink {
                                Ending()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.background) // Tornar transparente quando não estiver ativo
                                        .frame(width: 100, height: 50) // Definir tamanho zero inicialmente
                                        .scaleEffect(scaledButton ? 1.1 : 1.0)
                                        .opacity(showEndingLink ? 1 : 0)
                                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: scaledButton)
                                        .onAppear {
                                                scaledButton.toggle()
                                        }
                                    Text("Go to Ending")
                                        .font(.geoRegular(20))
                                        .foregroundColor(.black)
                                        .scaleEffect(scaledText ? 1.1 : 1.0)
                                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: scaledText)
                                        .opacity(showEndingLink ? 1 : 0) // Tornar o texto invisível inicialmente
                                        .onAppear {
                                                scaledText.toggle()
                                        }
                                }
                            }
                            .disabled(!showEndingLink) // Desabilitar o link até showEndingLink ser true
                        }
                        .padding()
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
