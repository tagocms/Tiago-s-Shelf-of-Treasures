//
//  Treasures.swift
//  TiagoTT
//
//  Created by Tiago Camargo Maciel dos Santos on 22/04/25.
//

import SwiftUI

struct Treasure {
    let title: String
    let releaseYear: Int
    let titleDescription: String
    let trait: String
    let traitDescription: String
    let object: String
    let objectDescription: String
    private(set) var isFound: Bool = true
}

struct TreasureView: View {
    @Environment(\.dismiss) var dismiss
    
    private let idCartridge: CartridgeType
    let treasure: Treasure
    
    init(idCartridge: CartridgeType) {
        self.idCartridge = idCartridge
        
        self.treasure = switch self.idCartridge {
        case .planescape:
            Treasure(title: "Planescape: Torment",
                     releaseYear: 1999,
                     titleDescription: "Takes place in the Planescape setting for Dungeons & Dragons. It's a story about an amnesiac immortal trying to understand what happened to him and who he is, on the *inside*.",
                     trait: "Organization and note taking",
                     traitDescription: "The main character, The Nameless One, is an immortal who constantly tattoos information he might need in the future on his own skin, because every time he dies, he forgets everything, making his notes extremely important.",
                     object: "Bronze Sphere",
                     objectDescription: "SPOILERS!! The Bronze Sphere is a constant source of trouble for the main character throughout the game, but it holds the most important thing of all: his name, and, in turn, his identity.")
        case .skyrim:
            Treasure(title: "Planescape: Torment",
                     releaseYear: 1999,
                     titleDescription: "Takes place in the Planescape setting for Dungeons & Dragons. It's a story about an amnesiac immortal trying to understand what happened to him and who he is, on the *inside*.",
                     trait: "Organization and note taking",
                     traitDescription: "The main character, The Nameless One, is an immortal who constantly tattoos information he might need in the future on his own skin, because every time he dies, he forgets everything, making his notes extremely important.",
                     object: "Bronze Sphere",
                     objectDescription: "SPOILERS!! The Bronze Sphere is a constant source of trouble for the main character throughout the game, but it holds the most important thing of all: his name, and, in turn, his identity.")
        case .dragonAge:
            Treasure(title: "Planescape: Torment",
                     releaseYear: 1999,
                     titleDescription: "Takes place in the Planescape setting for Dungeons & Dragons. It's a story about an amnesiac immortal trying to understand what happened to him and who he is, on the *inside*.",
                     trait: "Organization and note taking",
                     traitDescription: "The main character, The Nameless One, is an immortal who constantly tattoos information he might need in the future on his own skin, because every time he dies, he forgets everything, making his notes extremely important.",
                     object: "Bronze Sphere",
                     objectDescription: "SPOILERS!! The Bronze Sphere is a constant source of trouble for the main character throughout the game, but it holds the most important thing of all: his name, and, in turn, his identity.")
        case .divinity:
            Treasure(title: "Planescape: Torment",
                     releaseYear: 1999,
                     titleDescription: "Takes place in the Planescape setting for Dungeons & Dragons. It's a story about an amnesiac immortal trying to understand what happened to him and who he is, on the *inside*.",
                     trait: "Organization and note taking",
                     traitDescription: "The main character, The Nameless One, is an immortal who constantly tattoos information he might need in the future on his own skin, because every time he dies, he forgets everything, making his notes extremely important.",
                     object: "Bronze Sphere",
                     objectDescription: "SPOILERS!! The Bronze Sphere is a constant source of trouble for the main character throughout the game, but it holds the most important thing of all: his name, and, in turn, his identity.")
        case .baldursGate:
            Treasure(title: "Planescape: Torment",
                     releaseYear: 1999,
                     titleDescription: "Takes place in the Planescape setting for Dungeons & Dragons. It's a story about an amnesiac immortal trying to understand what happened to him and who he is, on the *inside*.",
                     trait: "Organization and note taking",
                     traitDescription: "The main character, The Nameless One, is an immortal who constantly tattoos information he might need in the future on his own skin, because every time he dies, he forgets everything, making his notes extremely important.",
                     object: "Bronze Sphere",
                     objectDescription: "SPOILERS!! The Bronze Sphere is a constant source of trouble for the main character throughout the game, but it holds the most important thing of all: his name, and, in turn, his identity.")
        case .pillarsOfEternity:
            Treasure(title: "Planescape: Torment",
                     releaseYear: 1999,
                     titleDescription: "Takes place in the Planescape setting for Dungeons & Dragons. It's a story about an amnesiac immortal trying to understand what happened to him and who he is, on the *inside*.",
                     trait: "Organization and note taking",
                     traitDescription: "The main character, The Nameless One, is an immortal who constantly tattoos information he might need in the future on his own skin, because every time he dies, he forgets everything, making his notes extremely important.",
                     object: "Bronze Sphere",
                     objectDescription: "SPOILERS!! The Bronze Sphere is a constant source of trouble for the main character throughout the game, but it holds the most important thing of all: his name, and, in turn, his identity.")
        case .underrail:
            Treasure(title: "Planescape: Torment",
                     releaseYear: 1999,
                     titleDescription: "Takes place in the Planescape setting for Dungeons & Dragons. It's a story about an amnesiac immortal trying to understand what happened to him and who he is, on the *inside*.",
                     trait: "Organization and note taking",
                     traitDescription: "The main character, The Nameless One, is an immortal who constantly tattoos information he might need in the future on his own skin, because every time he dies, he forgets everything, making his notes extremely important.",
                     object: "Bronze Sphere",
                     objectDescription: "SPOILERS!! The Bronze Sphere is a constant source of trouble for the main character throughout the game, but it holds the most important thing of all: his name, and, in turn, his identity.")
        case .witcher:
            Treasure(title: "Planescape: Torment",
                     releaseYear: 1999,
                     titleDescription: "Takes place in the Planescape setting for Dungeons & Dragons. It's a story about an amnesiac immortal trying to understand what happened to him and who he is, on the *inside*.",
                     trait: "Organization and note taking",
                     traitDescription: "The main character, The Nameless One, is an immortal who constantly tattoos information he might need in the future on his own skin, because every time he dies, he forgets everything, making his notes extremely important.",
                     object: "Bronze Sphere",
                     objectDescription: "SPOILERS!! The Bronze Sphere is a constant source of trouble for the main character throughout the game, but it holds the most important thing of all: his name, and, in turn, his identity.")
        case .darkSouls:
            Treasure(title: "Planescape: Torment",
                     releaseYear: 1999,
                     titleDescription: "Takes place in the Planescape setting for Dungeons & Dragons. It's a story about an amnesiac immortal trying to understand what happened to him and who he is, on the *inside*.",
                     trait: "Organization and note taking",
                     traitDescription: "The main character, The Nameless One, is an immortal who constantly tattoos information he might need in the future on his own skin, because every time he dies, he forgets everything, making his notes extremely important.",
                     object: "Bronze Sphere",
                     objectDescription: "SPOILERS!! The Bronze Sphere is a constant source of trouble for the main character throughout the game, but it holds the most important thing of all: his name, and, in turn, his identity.")
        case .cyberpunk:
            Treasure(title: "Planescape: Torment",
                     releaseYear: 1999,
                     titleDescription: "Takes place in the Planescape setting for Dungeons & Dragons. It's a story about an amnesiac immortal trying to understand what happened to him and who he is, on the *inside*.",
                     trait: "Organization and note taking",
                     traitDescription: "The main character, The Nameless One, is an immortal who constantly tattoos information he might need in the future on his own skin, because every time he dies, he forgets everything, making his notes extremely important.",
                     object: "Bronze Sphere",
                     objectDescription: "SPOILERS!! The Bronze Sphere is a constant source of trouble for the main character throughout the game, but it holds the most important thing of all: his name, and, in turn, his identity.")
        case .ttt:
            Treasure(title: "Planescape: Torment",
                     releaseYear: 1999,
                     titleDescription: "Takes place in the Planescape setting for Dungeons & Dragons. It's a story about an amnesiac immortal trying to understand what happened to him and who he is, on the *inside*.",
                     trait: "Organization and note taking",
                     traitDescription: "The main character, The Nameless One, is an immortal who constantly tattoos information he might need in the future on his own skin, because every time he dies, he forgets everything, making his notes extremely important.",
                     object: "Bronze Sphere",
                     objectDescription: "SPOILERS!! The Bronze Sphere is a constant source of trouble for the main character throughout the game, but it holds the most important thing of all: his name, and, in turn, his identity.")
        }
    }
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                Image("cardScene")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        HStack {
                            Image("game-\(idCartridge.rawValue)")
                                .resizable()
                                .scaleEffect(1)
                                .frame(width: 100, height: 100)
                                .position(x: 130, y: 90)
                            Image("item-\(idCartridge.rawValue)")
                                .resizable()
                                /*.scaleEffect(1)
                                 */
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .position(x: 60, y: 90)
                        }
                
                        VStack {
                            ScrollView {
                                Text("Title")
                                    .font(.geoOblique(20))
                                    .multilineTextAlignment(.leading)
                                Text(treasure.title)
                                    .font(.geoRegular(18))
                                    .multilineTextAlignment(.leading)
                                Text("Release Year")
                                    .font(.geoOblique(20))
                                    .multilineTextAlignment(.leading)
                                Text("\(treasure.releaseYear)")
                                    .font(.geoRegular(18))
                                    .multilineTextAlignment(.leading)
                                Text("Description")
                                    .font(.geoOblique(20))
                                    .multilineTextAlignment(.leading)
                                Text(treasure.titleDescription)
                                    .font(.geoRegular(18))
                                    .multilineTextAlignment(.leading)
                            }
                        }
                        .frame(width: 230, height: 150)
                        .position(x: 190, y: 60)
                        
                        
                        VStack {
                            ScrollView {
                                Text("Trait")
                                    .font(.geoOblique(20))
                                    .multilineTextAlignment(.leading)
                                    .truncationMode(.head)
                                Text(treasure.trait)
                                    .font(.geoRegular(18))
                                    .multilineTextAlignment(.leading)
                                Text("Trait Description")
                                    .font(.geoOblique(20))
                                    .multilineTextAlignment(.leading)
                                Text(treasure.traitDescription)
                                    .font(.geoRegular(18))
                                    .multilineTextAlignment(.leading)
                            }
                        }
                        .frame(width: 230, height: 150)
                        .position(x: 190, y: 70)
                        VStack {
                            ScrollView {
                                Text("Object")
                                    .font(.geoOblique(20))
                                    .multilineTextAlignment(.leading)
                                Text(treasure.object)
                                    .font(.geoRegular(18))
                                    .multilineTextAlignment(.leading)
                                Text("Object Description")
                                    .font(.geoOblique(20))
                                    .multilineTextAlignment(.leading)
                                Text(treasure.objectDescription)
                                    .font(.geoRegular(18))
                                    .multilineTextAlignment(.leading)
                            }
                        }
                        .frame(width: 230, height: 150)
                        .position(x: 190, y: 80)
                        
                    }
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
                }
            }
            .font(.geoRegular(20))
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true) // Esconde o BackButton padrão
    }
}

#Preview {
    TreasureView(idCartridge: .darkSouls)
}
