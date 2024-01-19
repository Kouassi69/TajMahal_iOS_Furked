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
        HStack {
            Image("\(myDish.imageName)")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding([.top, .leading, .bottom])
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
                    SpicyView(myDish: myDish)
                }
            }
            .font(.system(size: 10, weight: .light, design: .default))
            .frame(width: 180, height: 100)
            .padding()
        }
        .frame(height: 120)
        //.background(Color.red)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding()
    }
}


#Preview {
    ListView(myDish: exampleDish)
}
