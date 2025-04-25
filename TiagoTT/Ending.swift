//
//  Ending.swift
//  TiagoTT
//
//  Created by Tiago Camargo Maciel dos Santos on 23/04/25.
//

import SwiftUI

struct Ending: View {
    @State private var scaled: Bool = false
    @Environment(\.dismiss) var dismiss
    private let cartridgesPlaced: [CartridgeType]
    
    init(cartridgesPlaced: [CartridgeType]) {
        self.cartridgesPlaced = cartridgesPlaced
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image("tiago")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(1)
                        .imageScale(.medium)
                        .foregroundStyle(.tint)
                    
                    Text("Thank you!")
                        .foregroundColor(.black)
                        .font(.geoRegular(30))
                        .multilineTextAlignment(.leading)
                        .scaleEffect(scaled ? 1.1 : 1.0)
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: scaled)
                        .onAppear {
                                scaled.toggle()
                        }
                    Text("I hope you were able to get to know me a bit better. Feel free to return to the shelf anytime you want!")
                        .foregroundColor(.black)
                        .font(.geoRegular(24))
                        .multilineTextAlignment(.center)
                    
                }
                .padding()
                
                VStack {
                    Image("item-cyberpunk")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(cartridgesPlaced.count >= 10 ? 1 : 0)
                        .scaleEffect(0.2)
                        .position(x: 197, y: 178)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss() // Função para voltar à tela anterior
                    } label: {
                        HStack {
                            Image(systemName: "chevron.backward")
                                .foregroundColor(.black) // Defina a cor desejada aqui
                            Text("Back to the Shelf")
                                .foregroundColor(.black) // Defina a cor desejada aqui
                        }
                    }
                    .simultaneousGesture(TapGesture().onEnded { SoundManager.instance.playSound(name: "button", volume: 1)
                    })
                }
            }
            .font(.geoRegular(20))
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

#Preview {
    Ending(cartridgesPlaced: [
        .planescape,
        .skyrim,
        .cyberpunk,
        .baldursGate,
        .darkSouls,
        .witcher,
        .divinity,
        .dragonAge,
        .pillarsOfEternity,
        .underrail
    ])
}
