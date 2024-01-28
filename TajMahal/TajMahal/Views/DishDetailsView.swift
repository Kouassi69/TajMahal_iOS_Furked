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
            // s'assurer que myWidth ne devient jamais négatif afin d'éviter le message dans la console
            let myWidth = max(screenWidth - 30, 0)
            
            ScrollView {//Pour permettre la navigation quand le téléphone en en landscape
                VStack {
                    // Image principale avec le niveau spicy en haut à droite
                    ZStack(alignment: .top) {
                        mainDishImage(width: myWidth) //Appel de la fonction qui crée la vue image
                        spicyIndicator() //Appel de la fonction qui crée la vueniveau d'épice
                    }
                    // Détails du plat
                    additionalDishDetails() //Appel de la fonction qui crée la vue détails du plat
                    //.frame(width: myWidth) // Définit la largeur de la vue détaillée
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
    
    func mainDishImage(width: CGFloat) -> some View {
        Image("\(myDish.imageName)")
            .resizable()
            .scaledToFill()
            .frame(width: width, height: 450) // On fixe la hauteur de l'image
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    // Affiche l'indicateur de piquant du plat (SpicyView)
    func spicyIndicator() -> some View {
        HStack {
            Spacer()//pour pousser la vue sur la droite
            SpicyView(myDish: myDish)
                .frame(width: 70, height: 20)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
        }
    }
    
    // Affiche les détails supplémentaires du plat
    func additionalDishDetails() -> some View {
        VStack(alignment: .leading, content: {
            Group {
                Text("Allergènes:")
                    .foregroundStyle(.secondary)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                Text(myDish.allergens)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                    .foregroundStyle(.secondary)
                    .font(.system(size: 13, weight: .regular, design: .rounded))
                Divider()
                Text("Ingrédients:")
                    .foregroundStyle(.secondary)
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                Text(myDish.ingredients)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                    .foregroundStyle(.secondary)
                    .font(.system(size: 13, weight: .regular, design: .rounded))
            }
        })
        .padding(.top)
    }
}

#Preview {
    DishDetailsView(myDish: exampleDish)
}
