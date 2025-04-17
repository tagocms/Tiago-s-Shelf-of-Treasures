//
//  Cartridges.swift
//  TiagoTT
//
//  Created by Tiago Camargo Maciel dos Santos on 22/04/25.
//
import SwiftUI

enum Cartridges: CaseIterable {
    case planescape
    case skyrim
    case dragonAge
    case divinity
    case baldursGate
    case pillarsOfEternity
    case underrail
    case witcher
    case darkSouls
    case cyberpunk
    case ttt
}

struct Cartridge: View {    
    private let imageName: String
    
    @State var offset: CGSize = .zero
    @State var accumulated: CGSize = .zero
    @State var isDragging = false
    @State var width: CGFloat = 100
    @State var height: CGFloat = 50
    
    init(idCartridge: Cartridges, width: CGFloat = 100, height: CGFloat = 50) {
        self.imageName = switch idCartridge {
        case .planescape:
            "planescape"
        case .skyrim:
            "skyrim"
        case .dragonAge:
            "dragonAge"
        case .divinity:
            "divinity"
        case .baldursGate:
            "baldursGate"
        case .pillarsOfEternity:
            "pillarsOfEternity"
        case .underrail:
            "underrail"
        case .witcher:
            "witcher"
        case .darkSouls:
            "darkSouls"
        case .cyberpunk:
            "cyberpunk"
        case .ttt:
            "TTT"
        }
    }
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: isDragging ? width + 10 : width, height: isDragging ? height + 5 : height)
            .offset(offset)
            .animation(.spring())
            .gesture(DragGesture()
                .onChanged { value in
                    offset = CGSize(width: value.translation.width + accumulated.width, height: value.translation.height + accumulated.height)
                    isDragging = true
                }
                .onEnded({ value in
                    withAnimation {
                        offset = CGSize(width: value.translation.width + accumulated.width, height: value.translation.height + accumulated.height)
                        accumulated = offset
                        isDragging = false
                    }
                })
            )
            .onTapGesture {_ in
                width += 10
                height += 5
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    width -= 10
                    height -= 5
                }
            }
    }
}

#Preview {
    Cartridge(idCartridge: .ttt)
}
