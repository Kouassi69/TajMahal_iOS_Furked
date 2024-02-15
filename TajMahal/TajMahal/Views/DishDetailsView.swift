//
//  DishDetailsView.swift
//  TajMahal
//
//  Created by Kouassi Assoua on 17/01/2024.
//

import SwiftUI

struct DishDetailsView: View {
    @Environment(\.dismiss) var dismiss
    let myDish: Dish
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width //lecture de la taille de l'écran
            let screenHeight = geometry.size.height
            // s'assurer que myWidth ne devient jamais négatif afin d'éviter le message dans la console
            let myWidth = max(screenWidth - 30, 0)
            
            ScrollView {//Pour permettre la navigation quand le téléphone en en landscape
                VStack {
                    // Image principale avec le niveau spicy en haut à droite
                    ZStack(alignment: .top) {
                        mainDishImage(width: myWidth, height: 0.6 * screenHeight) //Appel de la fonction qui crée la vue image
                        spicyIndicator() //Appel de la fonction qui crée la vueniveau d'épice
                    }
                    // Détails du plat
                    additionalDishDetails() //Appel de la fonction qui crée la vue détails du plat
                }
                .frame(width: myWidth)
                .padding(.horizontal, 15) // Centre le contenu de VStack
                .navigationTitle("\(myDish.name)")
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: { dismiss() }) {
                            Image(systemName: "chevron.backward").foregroundColor(.primary)
                        }
                    }
                }
            }
        }
    }
    
    func mainDishImage(width: CGFloat, height: CGFloat) -> some View {
        Image("\(myDish.imageName)")
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height) // On fixe la hauteur de l'image
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    // Affiche l'indicateur de piquant du plat (SpicyView)
    func spicyIndicator() -> some View {
        HStack {
            Spacer()//pour pousser la vue sur la droite
            SpicyView(myDish: myDish)
                .frame(width: 70, height: 22)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(12)
            
        }
    }
    
    // Affiche les détails supplémentaires du plat
    func additionalDishDetails() -> some View {
        VStack(alignment: .leading, content: {
            Group {
                Text("Allergènes:")
                    .fontWeight(.medium)
                Spacer()
                Text(myDish.allergens)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                Divider().padding(.vertical)
                Text("Ingrédients:")
                    .fontWeight(.medium)
                Spacer()
                Text(myDish.ingredients)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
            }
            .foregroundStyle(.secondary)
            .font(.custom(myFontName, size: 12 * dynamicFontSize))
        })
        .padding(.top)
    }
}

#Preview {
    DishDetailsView(myDish: exampleDish)
}
