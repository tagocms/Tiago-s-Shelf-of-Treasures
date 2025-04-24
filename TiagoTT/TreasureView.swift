//
//  TreasureView.swift
//  TiagoTT
//
//  Created by Tiago Camargo Maciel dos Santos on 23/04/25.
//

import SwiftUI

struct TreasureView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                Text("TreasureView")
            }
        }
    }
}


#Preview {
    TreasureView()
}
