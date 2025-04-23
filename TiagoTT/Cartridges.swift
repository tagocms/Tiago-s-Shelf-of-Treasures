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
    private let screenSize: CGSize
    private let originX: CGFloat
    private let originY: CGFloat
    private let idCartridge: Cartridges
    
    @State var offset: CGSize = .zero
    @State var accumulated: CGSize = .zero
    @State var isDragging = false
    @State var width: CGFloat = 100
    @State var height: CGFloat = 50
    
    init(idCartridge: Cartridges, width: CGFloat = 100, height: CGFloat = 50, screenSize: CGSize, originX: CGFloat, originY: CGFloat) {
        self.width = width
        self.height = height
        self.screenSize = screenSize
        self.originX = originX
        self.originY = originY
        self.idCartridge = idCartridge
        self.imageName = switch self.idCartridge {
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
                    let newOffset = CGSize(width: value.translation.width + accumulated.width, height: value.translation.height + accumulated.height)
                    offset = CGSize(width: limitX(newOffset.width), height: limitY(newOffset.height))
                    isDragging = true
                }
                .onEnded({ value in
                    withAnimation {
                        let finalOffset = CGSize(width: value.translation.width + accumulated.width, height: value.translation.height + accumulated.height)
                        accumulated = CGSize(width: limitX(finalOffset.width), height: limitY(finalOffset.height))
                        offset = accumulated
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
    private func limitX(_ x: CGFloat) -> CGFloat {
        let screenWidth = screenSize.width
        let maxX = screenWidth - originX - (width / 2)
        let minX = -originX + width / 2
        return max(minX, min(maxX, x))
    }
    
    private func limitY(_ y: CGFloat) -> CGFloat {
        let screenHeight = screenSize.height
        let maxY = screenHeight - originY
        let minY = -originY + height / 2
        return max(minY, min(maxY, y))
    }
}

#Preview {
    Cartridge(idCartridge: .ttt, screenSize: CGSize(width: 393, height: 759), originX: 0, originY: 0).position(x: 0, y: 0)
}
