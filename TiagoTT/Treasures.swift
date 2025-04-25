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
            Treasure(title: "The Elder Scrolls V: Skyrim",
                     releaseYear: 2011,
                     titleDescription: "It's a story about an adventurer who embarks on a quest to save the world from an ancient dragon who seeks to devour it. The game is known for its vast open world, rich lore, and endless possibilities for exploration.",
                     trait: "Curiosity",
                     traitDescription: "The game's main appeal is its exploration and the freedom to do whatever you want. The player can become anyone they want to be, and do anything they want to do. Every nook and cranny is explorable and filled with secrets and stories waiting to be discovered, making curiosity essential to the gameplay loop.",
                     object: "Iron Helmet",
                     objectDescription: "The Iron Helmet represents the first steps the player takes in Skyrim and helps demonstrate how far they have come, once they acquire legendary gear.")
        case .dragonAge:
            Treasure(title: "Dragon Age: Origins",
                     releaseYear: 2009,
                     titleDescription: "Dragon Age: Origins is a game set in a land threatened by war with the Darkspawn, whose only goal is the destruction of civilization. The player must join a sect dedicated to fighting them and embarks on a quest across the land to convince local leaders to unite and aid in defeating them.",
                     trait: "Practicality",
                     traitDescription: "The game is extremely good at everything it does, and that's because the developers left out anything that would interfere with the experience they planned to deliver to the gamers. The game is focused on the player's journey and the choices they make - with every area having interesting stories and conflicts to resolve -, and this is accomplished at every turn.",
                     object: "Darkspawn Taint",
                     objectDescription: "The Darkspawn, the game's main enemies, are creatures born by corrupting the races of humans, elves and dwarves. Even so, the game's plot hinges on the player character taking that taint into themselves to become like them in order to defeat them.")
        case .divinity:
            Treasure(title: "Divinity: Original Sin 2",
                     releaseYear: 2016,
                     titleDescription: "A prominent religious order is rounding up people believed to have godly powers into prisons, so they do not prove to be a threat to other people. The player is one of these prisoners, who escapes their captivity and gets tangled into a web of conspiracies that could change the fate of the world.",
                     trait: "Creativity",
                     traitDescription: "The game promotes creativity by means of its systemic design, in which all systems interact with each other brilliantly. For example, water puts out fires, but in doing so creates smoke, which obscures vision. This means that the player must constantly think about how to use the world around them to their advantage.",
                     object: "Barrel",
                     objectDescription: "Barrels are iconic in this game, because they can hold any number of other objects and retain their properties, making it easy to stock a lot of explosives in a single barrel and lob it at enemies, causing a devastating explosion that is a lot of fun to watch.")
        case .baldursGate:
            Treasure(title: "Baldur's Gate",
                     releaseYear: 1998,
                     titleDescription: "Baldur's Gate takes place in the Forgotten Realms setting for Dungeons & Dragons, specifically in the Sword Coast and the titular city, Baldur's Gate. The game takes the player on a journey through a complex world with complex tasks to accomplish, providing a vast amount of freedom and enormous agency to the player in what they choose to do and how they wish to do it.",
                     trait: "Excellence",
                     traitDescription: "Baldur's Gate is one of the first open world computer RPGs whose world was hand crafted and whose characters grew alongside the player. It's a huge game and takes hundreds of hours to complete - not to mention all the missable content, be it consequence of a decision the player made or otherwise. It's amazing how this was made in a short time span and before modern game engines. Every bit of this ambitious game is incredible.",
                     object: "Symbol of Bhaal",
                     objectDescription: "The main character is the child of the former God of Muder, Bhaal, who created thousands of offspring in hopes that one day he might be resurrected. Thus, the player must choose to fight his influence or embrace it.")
        case .pillarsOfEternity:
            Treasure(title: "Pillars of Eternity",
                     releaseYear: 2015,
                     titleDescription: "Pillars of Eternity is set in a modern fantasy setting, full of swords, antique firearms, colonization of new lands and magical artefacts. It's an extremely fresh take on the fantasy genre, with a focus on character development, developing relationships with other characters and exploration of the world around the player, that fits well with its darker tone.",
                     trait: "Skepticism",
                     traitDescription: "The world in which the game takes place had no gods, until an ancient human civilization managed to ascend to godhood by means of merging their souls with each other. They did this to guide the world and make it better overall. But, with these great powers they also began serving themselves and make every effort to mask the truth about their conception to other civilizations.",
                     object: "Leaden Key",
                     objectDescription: "The Leaden Key represents a cult that serves the world's gods, and they wish to conceal their secrets from the mortal world.")
        case .underrail:
            Treasure(title: "Underrail",
                     releaseYear: 2015,
                     titleDescription: "Underrail is set in a post-apocalyptic world where humanity was driven underground by the devastation of the surface. What happened up there is a mystery, and there have been a lot of generations of people living underground already. The player is simply trying to find his way in the world and help his station - the equivalent of a town or village -, but gets caught up in politics and more sinister affairs.",
                     trait: "Resourcefulness",
                     traitDescription: "The game is brutally difficult, making it essential for the player to plan ahead of combat encounters and to be resourceful in finding ways to overcome them.",
                     object: "Gas Mask",
                     objectDescription: "The Gas Mask is a common accessory found throughout Underrail, as it allows people to breathe the polluted air.")
        case .witcher:
            Treasure(title: "The Witcher 3: Wild Hunt",
                     releaseYear: 2015,
                     titleDescription: "The Witcher 3: Wild Hunt is set in a war-torn land filled with monsters, mythical creatures and other dangers. The player takes on the role of Geralt of Rivia, a witcher, who is trying to find his adoptive daugher, Cirilla",
                     trait: "Duty and Discipline",
                     traitDescription: "Witchers are humans genetically altered for the express purpose of hunting down monsters and keeping people safe from them. At all times, they seek to fulfill their duty to the best of their ability, while also receiving rewards for doing so.",
                     object: "Witcher Medallion",
                     objectDescription: "All witcher carry a medallion on their neck, which is a symbol of their profession and the duty they carry to keep people safe from monsters.")
        case .darkSouls:
            Treasure(title: "Dark Souls",
                     releaseYear: 2011,
                     titleDescription: "Dark Souls is set in a stagnant world, full of hollow people and despair. The player is a prisoner in an Asylum for the undead - people cursed with eternal life, that is, until they become hollow themselves. The main character must find a way to rid the world of this stagnancy, either by postponing it or embracing the ending of its current state.",
                     trait: "Resilience",
                     traitDescription: "Dark Souls is a difficult game that forces you to learn and know it like the back of your hand, through its unforgiving enemies and interconnected world. The player will fail a number of times, but the game encourages them to keep moving forward.",
                     object: "Bonfire",
                     objectDescription: "The Bonfire represents safety and respite, both extremely necessary in the dangerous world of Dark Souls.")
        case .cyberpunk:
            Treasure(title: "Cyberpunk 2077",
                     releaseYear: 2020,
                     titleDescription: "Set in a futuristic and hopeless world, Cyberpunk 2077 shows the consequences of unregulated capitalism and human greed. Crime is a necessity to survive, and corporations hold enormous amounts of power and influence, making it incredibly expensive to even stay alive. The player takes the role of V, a mercenary who dreams of becoming a legendary figure in the sprawling metropolis of Night City.",
                     trait: "Restlessness",
                     traitDescription: "Johnny Silverhand, one of the game's characters, is extremely anti-system and wishes to see it all burn so that everyone could be free. Though very extreme, his wish for change - of what could be that is better than the current state - is contagious, making the dream of a better life for everyone alive in the player's heart.",
                     object: "Johnny Silverhand's Glasses",
                     objectDescription: "Johnny is an extremely iconic and well-crafted character, and his glasses symbolize the barrier he has put up against the cruel outside world.")
        case .ttt:
            Treasure(title: "Placeholder",
                     releaseYear: 2000,
                     titleDescription: "Placeholder text",
                     trait: "Placeholder text",
                     traitDescription: "Placeholder text",
                     object: "Placeholder text",
                     objectDescription: "Placeholder text")
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
                
                        VStack(alignment: .leading) {
                            ScrollView {
                                Text("Title")
                                    .font(.geoOblique(20))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                Text(treasure.title)
                                    .font(.geoRegular(18))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                Text("")
                                Text("Release Year")
                                    .font(.geoOblique(20))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                Text(String(treasure.releaseYear))
                                    .font(.geoRegular(18))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                Text("")
                                Text("Description")
                                    .font(.geoOblique(20))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                Text(treasure.titleDescription)
                                    .font(.geoRegular(18))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            }
                        }
                        .frame(width: 230, height: 170)
                        .position(x: 190, y: 70)
                        
                        
                        VStack(alignment: .leading) {
                            ScrollView {
                                Text("Trait")
                                    .font(.geoOblique(20))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                Text(treasure.trait)
                                    .font(.geoRegular(18))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                Text("")
                                Text("Trait Description")
                                    .font(.geoOblique(20))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                Text(treasure.traitDescription)
                                    .font(.geoRegular(18))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            }
                        }
                        .frame(width: 230, height: 170)
                        .position(x: 190, y: 82.5)
                        VStack(alignment: .leading) {
                            ScrollView {
                                Text("Object")
                                    .font(.geoOblique(20))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                Text(treasure.object)
                                    .font(.geoRegular(18))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                Text("")
                                Text("Object Description")
                                    .font(.geoOblique(20))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                Text(treasure.objectDescription)
                                    .font(.geoRegular(18))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            }
                        }
                        .frame(width: 230, height: 150)
                        .position(x: 190, y: 95)
                        
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
                    .simultaneousGesture(TapGesture().onEnded { SoundManager.instance.playSound(name: "button", volume: 1)
                    })
                }
            }
            .font(.geoRegular(20))
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true) // Esconde o BackButton padrão
    }
}

#Preview {
    TreasureView(idCartridge: .skyrim)
}
