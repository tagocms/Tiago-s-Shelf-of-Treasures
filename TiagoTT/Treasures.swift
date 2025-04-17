//
//  Treasures.swift
//  TiagoTT
//
//  Created by Tiago Camargo Maciel dos Santos on 22/04/25.
//

import SwiftUI

struct Treasures {
    private let idCartridge: Cartridges
    let title: String
    let releaseYear: Int
    let titleDescription: String
    let trait: String
    let traitDescription: String
    let object: String
    let objectDescription: String
    
    private(set) var isFound = false
    
    init(idCartridge: Cartridges, title: String, releaseYear: Int, titleDescription: String, trait: String, traitDescription: String, object: String, objectDescription: String, isFound: Bool) {
        self.idCartridge = idCartridge
        self.title = title
        self.releaseYear = releaseYear
        self.titleDescription = titleDescription
        self.trait = trait
        self.traitDescription = traitDescription
        self.object = object
        self.objectDescription = objectDescription
        self.isFound = isFound
    }
}
