//
//  Cartridges.swift
//  TiagoTT
//
//  Created by Tiago Camargo Maciel dos Santos on 22/04/25.
//
import SwiftUI

enum Cartridges: String, CaseIterable  {
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
    
    //Posição da area de colisão da tela
    let xDestination: CGFloat
    let yDestination: CGFloat
    
    //Tamanho da área de colisão
    let colissionAreaWidth: CGFloat = 100
    let colissionAreaHeight: CGFloat = 50
    
    //Flag de colisão
    @State var isCollided = false
    
    
    //Variáveis de Drag
    @State var offset: CGSize = .zero
    @State var accumulated: CGSize = .zero
    @State var isDragging = false
    @State var width: CGFloat = 100
    @State var height: CGFloat = 50
    
    init(idCartridge: Cartridges, width: CGFloat = 100, height: CGFloat = 50, screenSize: CGSize, originX: CGFloat, originY: CGFloat, xDestination: CGFloat, yDestination: CGFloat) {
        self.width = width
        self.height = height
        self.screenSize = screenSize
        self.originX = originX
        self.originY = originY
        self.xDestination = xDestination
        self.yDestination = yDestination
        self.idCartridge = idCartridge
        self.imageName = self.idCartridge.rawValue
    }
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: isDragging ? width + 10 : width, height: isDragging ? height + 5 : height)
            .offset(offset)
            .animation(.spring())
            .gesture(DragGesture()
                .onChanged { value in
                    if !isCollided {
                        let newOffset = CGSize(width: value.translation.width + accumulated.width, height: value.translation.height + accumulated.height)
                        offset = CGSize(width: limitX(newOffset.width), height: limitY(newOffset.height))
                        isDragging = true
                        checkCollision()
                    }
                }
                .onEnded({ value in
                    withAnimation {
                        if !isCollided {
                            let finalOffset = CGSize(width: value.translation.width + accumulated.width, height: value.translation.height + accumulated.height)
                            accumulated = CGSize(width: limitX(finalOffset.width), height: limitY(finalOffset.height))
                            offset = accumulated
                            isDragging = false
                        }
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
                
                if isCollided {
                    
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
    
    private func checkCollision() {
        if abs(xDestination - offset.width - originX) < colissionAreaWidth && abs(yDestination - offset.height - originY) < colissionAreaHeight {
                
            offset.width = xDestination - originX
            offset.height = yDestination - originY
            
            isCollided = true
        } else {
            isCollided = false
        }
    }
}

#Preview {
    Cartridge(idCartridge: .ttt, screenSize: CGSize(width: 393, height: 759), originX: 0, originY: 0, xDestination: 100, yDestination: 200).position(x: 0, y: 0)
}
