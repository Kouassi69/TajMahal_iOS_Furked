//
//  ListView.swift
//  TajMahal
//
//  Created by Kouassi Assoua on 14/01/2024.
//

import SwiftUI

struct ListRowView: View {
    
    // Je déclare le repas de façon général afin de pouvoir adapter les données
    let myDish: Dish
    let lineHeight : CGFloat = 90

    var body: some View {
        HStack {
            Image("\(myDish.imageName)")
                .resizable()
                .scaledToFill()
                .frame(width: myScreenWidth / 3, height: lineHeight) // pour assurer que l'image prend bien 1/3 de l'espace
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.trailing, 12)
            VStack(alignment: .leading) {
                Text("\(myDish.name)")
                    .font(.custom(myFontName, size: 14 * dynamicFontSize))
                    .fontWeight(.semibold)
                Spacer()
                Text("\(myDish.description)")
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                    .font(.custom(myFontName, size: 12 * dynamicFontSize))
                Spacer()
                HStack {
                    Text("\(myDish.price)")
                        .font(.custom(myFontName, size: 12 * dynamicFontSize))
                        .fontWeight(.semibold)
                    Spacer()
                    SpicyView(myDish: myDish)
                    //.padding()
                }
            }.padding(.leading, 12)
        }
        .frame(height: lineHeight)
        .foregroundStyle(.secondary)
        .background(Color.white)
        .padding(12)
    }
}

#Preview {
    ListRowView(myDish: exampleDish) //, lineWidth: 393 - 50, imageWidth: 131)
}
