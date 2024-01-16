//
//  ListView.swift
//  TajMahal
//
//  Created by Kouassi Assoua on 14/01/2024.
//

import SwiftUI

struct ListView: View {
    //Je déclare le repas de façon général afin de pouvoir adapter les données
    let myDish: Dish
    var body: some View {
        //Je récupère les dimensions de l'écran
        //GeometryReader { geometry in
        //let screenWidth = geometry.size.width
        //let screenHeight = geometry.size.width
        //Group {
        HStack {
            Image("\(myDish.imageName)")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 100)
                .clipShape(.rect(cornerSize: CGSize(width: 10.0, height: 10.0)))
                .padding([.top, .leading, .bottom])
            //Spacer()
            VStack(alignment: .leading) {
                Text("\(myDish.name)")
                    .foregroundStyle(.primary)
                    .font(.system(size: 15, weight: .semibold, design: .monospaced))
                // .font(.custom("Arial",fixedSize: 34).weight(.black))
                Spacer()
                Text("\(myDish.description)")
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                    .foregroundStyle(.secondary)
                    .font(.system(size: 13, weight: .regular, design: .rounded))
                Spacer()
                HStack {
                    Text("\(myDish.price)")
                        .foregroundStyle(.secondary)
                        .font(.system(size: 15, weight: .semibold, design: .default))
                    Spacer()
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
            .font(.system(size: 10, weight: .light, design: .default))
            .frame(width: 180, height: 100)
            .padding()
        }
        .frame(height: 120)
        //.background(Color.red)
        .clipShape(.rect(cornerSize: CGSize(width: 10.0, height: 10.0)))
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
    ListView(myDish: Dish(name: "Samosas aux légumes", description: "Poulet mariné, grillé et servi dans une sauce masal", allergens: "Test", ingredients: "Test", spiceLevel: .light, imageName: "Samosas", price: "3,50€"))
}
