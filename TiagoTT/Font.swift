//
//  Font.swift
//  TiagoTT
//
//  Created by Tiago Camargo Maciel dos Santos on 22/04/25.
//

import SwiftUI

extension Font {
    static func geoRegular(_ size: CGFloat, relativeTo style: TextStyle = .body) -> Font {
        Font.custom("Geo-Regular", size: size, relativeTo: style)
    }
    
    static func geoOblique(_ size: CGFloat, relativeTo style: TextStyle = .body) -> Font {
        Font.custom("Geo-Oblique", size: size, relativeTo: style)
    }
}
