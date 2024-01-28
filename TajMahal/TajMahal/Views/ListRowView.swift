//
//  ListView.swift
//  TajMahal
//
//  Created by Kouassi Assoua on 14/01/2024.
//

import SwiftUI

struct ListRowView: View {
    
    //Je déclare le repas de façon général afin de pouvoir adapter les données
    let myDish: Dish
    //let myWidth : CGFloat = 120
    let lineWidth : CGFloat
    let imageWidth : CGFloat
    
    
    var body: some View {
        //GeometryReader { geometry in
        //let screenWidth = geometry.size.width //lecture de la taille de l'écran
        // s'assurer que myWidth ne devient jamais négatif afin d'éviter le message dans la console
        //let myWidth = max(screenWidth - 30, 0)
        let space : CGFloat = 60
        let textWidth = max(lineWidth - imageWidth - space, 0)
        let myHeight : CGFloat = 100
        
        HStack {
            Image("\(myDish.imageName)")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
            Spacer()
                
        }
        
        /*
         HStack {
         
         Image("\(myDish.imageName)")
         .resizable()
         //.scaledToFit()
         .aspectRatio(CGSize(width: 4, height: 3), contentMode: .fit)
         .frame(width: imageWidth)//, height: myHeight)
         //.aspectRatio(contentMode: .fit)
         
         
         .clipShape(RoundedRectangle(cornerRadius: 10))
         .padding(.trailing)
         
         VStack(alignment: .leading) {
         Text("\(myDish.name)")
         .frame(width: textWidth, alignment: .leading)
         .foregroundStyle(.primary)
         .font(.system(size: 13, weight: .semibold, design: .default))
         
         Spacer()
         Text("\(myDish.description)")
         .frame(width: textWidth - 20, alignment: .leading)
         .multilineTextAlignment(.leading)
         .fixedSize(horizontal: false, vertical: true)
         .lineLimit(nil)
         .foregroundStyle(.secondary)
         .font(.system(size: 11, weight: .regular, design: .rounded))
         
         Spacer()
         HStack {
         Text("\(myDish.price)")
         .foregroundStyle(.secondary)
         .font(.system(size: 15, weight: .semibold, design: .default))
         Spacer()
         SpicyView(myDish: myDish)
         }.frame(width: textWidth)
         }
         .font(.system(size: 10, weight: .light, design: .default))
         //.frame(width: textWidth, height: myHeight)
         .padding(.leading)
         }
         .frame(width: lineWidth, height: myHeight)//, alignment: .center)
         .background(Color.red)
         //.clipShape(RoundedRectangle(cornerRadius: 10))
         //.padding()
         }*/
    }
}
//}


#Preview {
    ListRowView(myDish: exampleDish, lineWidth: 393 - 50, imageWidth: 131)
}
