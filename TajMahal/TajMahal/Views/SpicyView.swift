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
        HStack {//cette partie pour créer le nombre d'étoiles rouge en fonction du niveau d'épices.
            let spicy = getSpicyFunc(spice: myDish.spiceLevel) //Je détermine le niveau d'épices
            ForEach(0..<spicy, id: \.self) { _ in
                createSpicyImage().foregroundStyle(Color.red) //je crée les étoiles rouges correspondantes
            }
            ForEach(0..<(3-spicy), id: \.self) { _ in //je crée le reste des étoiles qui sont grises
                createSpicyImage().foregroundStyle(.secondary)
            }
        }
    }
}

//Fonction pour créer les imagesSpicy de base
func createSpicyImage() -> some View {
    let myImage: Image? = Image(systemName: "star.fill")
    guard let image = myImage else {
        print("Image not found")
        print(Error.Type.self)
        return AnyView(EmptyView())
    }
    return AnyView(image
            .resizable()
            .frame(width: 20, height: 20, alignment: .trailing)
            .scaledToFit()
    )
}

#Preview {
    SpicyView(myDish: exampleDish)
}
