//
//  DishDetailsView.swift
//  TajMahal
//
//  Created by Kouassi Assoua on 17/01/2024.
//
/*
 import SwiftUI
 
 struct DishDetailsView: View {
 let myDish: Dish
 var body: some View {
 
 //Je récupère les dimensions de l'écran
 GeometryReader { geometry in
 let screenWidth = geometry.size.width
 //let screenHeight = geometry.size.width
 let myWidth = screenWidth - 30
 
 VStack(alignment: .center, content: {
 ZStack {
 Image("Biryani")
 .resizable()
 .frame(width: myWidth, height: 500, alignment: .center)
 .scaledToFit()
 .background(Color.red)
 .clipShape(.rect(cornerSize: CGSize(width: 20.0, height: 20.0)))
 
 //.padding()
 
 ZStack {
 HStack {
 Spacer() // Pousse vers la droite
 VStack {
 SpicyView(myDish: exampleDish)
 .frame(width: 100, height: 30, alignment: .center)
 .background(.white)
 .clipShape(.rect(cornerSize: CGSize(width: 20.0, height: 20.0)))
 .padding(30)
 
 Spacer() // Pousse vers le haut
 }
 }
 }
 }
 Spacer()
 Spacer()
 Spacer()
 Spacer()
 Spacer()
 Spacer()
 Text("Allergènes:")
 Text("\(exampleDish.allergens)")
 
 Divider()
 
 Spacer()
 Text("Ingrédients:")
 Text("\(exampleDish.ingredients)")
 
 })
 }
 
 }
 }
 
 
 
 #Preview {
 DishDetailsView(myDish: exampleDish)
 }*/

import SwiftUI

struct DishDetailsView: View {
    
    // Cette ligne pour annuler la présentation courante
    @Environment(\.dismiss) var dismiss
    
    let myDish: Dish
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let myWidth = screenWidth - 30
            
            VStack(alignment: .center) {
                
                // Image principale avec le niveau spicy en haut à droite
                    ZStack(alignment: .topTrailing) {
                        mainDishImage(width: myWidth)
                        spicyIndicator().padding()
                    }
                    //.frame(width: myWidth, height: 500)
           
                // Détails du plat
                additionalDishDetails(width: myWidth)
                    //.frame(alignment: .top)
            }
            .padding()
            .navigationTitle("\(myDish.name)").frame(alignment: .leading) // Ajout du titre de la navigation
            .navigationBarBackButtonHidden(true) // Cacher le bouton de retour par défaut
            .toolbar {
                // Configuration du nouveau bouton de retour
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss() // Action pour retourner à la vue précédente
                    }) {
                        // Utilisation d'une image pour le bouton de retour
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
    
    // Affiche l'image principale du plat
    /*
    func mainDishImage(width: CGFloat) -> some View {
        Image("\(myDish.imageName)")
            .resizable()
            .aspectRatio(contentMode: .fill) // Modifier le contentMode ici
            .frame(width: width, height: 500) // Définir la largeur et la hauteur
            .clipped() // S'assurer que l'image ne dépasse pas du cadre
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
*/
    func mainDishImage(width: CGFloat) -> some View {
        Image("\(myDish.imageName)")
            .resizable()
            .scaledToFill()
            .frame(width: width, height: 500, alignment: .center)
        //.background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(alignment: .center)
    }
    
    // Affiche l'indicateur de piquant (SpicyView)
    func spicyIndicator() -> some View {
        VStack {
            HStack {
                Spacer()
                SpicyView(myDish: myDish)
                    .frame(width: 100, height: 30)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                //.padding(20)
            }
            Spacer()
        }
    }
    
    // Affiche les détails supplémentaires du plat
    func additionalDishDetails(width: CGFloat) -> some View {
        VStack(alignment: .leading, content: {
            Group {
                Text("Allergènes:")
                    .foregroundStyle(.secondary)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Text(myDish.allergens)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                    .foregroundStyle(.secondary)
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                Divider()
                Text("Ingrédients:")
                    .foregroundStyle(.secondary)
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                Text(myDish.ingredients)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                    .foregroundStyle(.secondary)
                    .font(.system(size: 15, weight: .regular, design: .rounded))
            }
            //.padding(.top)
        })
        //.frame(width: width)
        
    }
}

#Preview {
    DishDetailsView(myDish: exampleDish)
}

