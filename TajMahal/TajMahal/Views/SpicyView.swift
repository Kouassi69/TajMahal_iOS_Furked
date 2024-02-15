//
//  SpicyView.swift
//  TajMahal
//
//  Created by Kouassi Assoua on 17/01/2024.
//

import SwiftUI

struct SpicyView: View {
    let myDish: Dish
    var body: some View {
        // Cette partie pour créer le nombre de piments rouge et gris en fonction du niveau d'épices.
        HStack {
            let spicy = getSpicyFunc(spice: myDish.spiceLevel) // Je détermine le niveau d'épices
            ForEach(0..<spicy, id: \.self) { _ in
                Image("Piment colore")
            }
            ForEach(0..<(3-spicy), id: \.self) { _ in // Je crée le reste des piments qui sont grisés
                Image("Piment")
            }
        }
    }
}

#Preview {
    SpicyView(myDish: exampleDish)
}
