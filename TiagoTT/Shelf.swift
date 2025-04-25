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
    @State private(set) var cartridgesPlaced = [CartridgeType]()
    
    @State private var scaledButton: Bool = false
    @State private var scaledText: Bool = false
    
    private var textGuide: String {
        switch self.cartridgesPlaced.count {
        case ...0:
            "What a mess! Can you help me organize the shelves with my RPG videogame cartridges, please? I need to place them in the correct spots to remember who I am."
        case 1...8:
            "Wow! Thank you so much for this! Can you help me with the others, please? There are only \(10 - self.cartridgesPlaced.count) left."
        case 9:
            "Almost there! Only \(10 - self.cartridgesPlaced.count) left."
        default:
            "You did it! I can finally remember who I am. Now, you can click on the cartridges to understand how each game makes me... well... me!"
        }
    }
    
    private(set) static var cartridges = CartridgeType.allCases
    private let destinations: [(width: CGFloat, height: CGFloat)] = [
        (80, 218),
        (195, 218),
        (310, 218),
        (80, 300),
        (195, 300),
        (310, 300),
        (80, 385),
        (195, 385),
        (310, 385),
        (80, 465),
    ]
    
    private var x: [CGFloat] = [CGFloat]()
    private var y: [CGFloat] = [CGFloat]()
    
    init() {
        for _ in 0..<Self.cartridges.count - 1 {
            x.append(Self.limitedX())
        }
        
        for _ in 0..<Self.cartridges.count - 1 {
            y.append(Self.limitedY())
        }
    }

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
                            .resizable()
                            .frame(width: 81, height: 81)
                            .aspectRatio(contentMode: .fit)
                            .position(x: 50, y: 50)
                        
                        Text(textGuide)
                            .font(.geoRegular(21))
                            .position(x: 240, y: 0)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            .frame(minWidth: 200, idealWidth: 300, maxWidth: 300, minHeight: 10, idealHeight: 20, maxHeight: .infinity, alignment: .topLeading)
                        
                        Image("plant")
                            .position(x: 320, y: 580)
                            .shadow(radius: 10)
                        
                    }
                    
                    
                    ForEach(0..<Shelf.cartridges.count - 1, id: \.self) { i in
                        
                        Cartridge(
                            idCartridge: Shelf.cartridges[i],
                            screenSize: g.size,
                            originX: x[i],
                            originY: y[i],
                            xDestination: destinations[i].width,
                            yDestination: destinations[i].height,
                            //Tentar fazer essa closure funcionar, deve estar zoada
                            closure: { id in
                                self.cartridgesPlaced.append(id)
                                if self.cartridgesPlaced.count >= 1 {
                                    showEndingLink = true
                                }
                            }
                        )
                        .position(x: x[i], y: y[i])
                    }
                    
                    // Condicional para mostrar o NavigationLink
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink {
                                Ending(cartridgesPlaced: self.cartridgesPlaced)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.white) // Tornar transparente quando não estiver ativo
                                        .frame(width: 100, height: 50) // Definir tamanho zero inicialmente
                                        .scaleEffect(scaledButton ? 1.1 : 1.0)
                                        .opacity(showEndingLink ? 1 : 0)
                                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: scaledButton)
                                        .onAppear {
                                                scaledButton.toggle()
                                        }
                                    Text("That's enough...")
                                        .font(.geoRegular(16))
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
                            .simultaneousGesture(TapGesture().onEnded { SoundManager.instance.playSound(name: "button", volume: 1)
                            })
                        }
                        .padding()
                    }
                }
                .background(.white)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
        }
        
    }
    
    static func limitedX() -> CGFloat {
            let minX: CGFloat = 50 // mínimo limite
            let maxX: CGFloat = UIScreen.main.bounds.width - 150 // máximo limite
            return CGFloat.random(in: minX...maxX)
        }
        
    static func limitedY() -> CGFloat {
        let minY: CGFloat = 600 // limite superior
        let maxY: CGFloat = UIScreen.main.bounds.height - 150 // limite inferior
        return CGFloat.random(in: minY...maxY)
    }
}

#Preview {
    Shelf()
}
