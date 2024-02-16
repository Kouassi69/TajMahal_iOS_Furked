//
//  WelcomeView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//
import SwiftUI

struct WelcomeView: View {

    var body: some View {
        NavigationStack {
            VStack {
                Image("TajMahal")
                    .resizable()
                    .frame(width: myWidth, height: 0.5 * myHeight)
                    .scaledToFill()
                    .padding()
                restaurantInfo
                    .padding(.vertical)
                restaurantDetails
                    .padding(.vertical)
                navigationButton
            }
        }
    }

    var restaurantInfo: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Restaurant Indien")
                    .font(.custom(myFontName, size: 16 * dynamicFontSize))
                    .foregroundStyle(.secondary)
                Spacer()
                Text("Taj Mahal")
                    .font(.custom(myFontName, size: 22 * dynamicFontSize))
                    .foregroundStyle(.primary)
                    .fontWeight(.bold)
            }
            Spacer()
            Image("Logo")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.secondary)
        }
        .frame(width: myWidth, height: 0.05 * myHeight)
    }

    var restaurantDetails: some View {
        VStack(alignment: .leading) {
            labelRow(text: "11h30 - 14h30 . 18h30 - 22h00", label: "Mardi", imageName: "Horaire")
            Spacer()
            labelRow(text: "À emporter", label: "Type de service", imageName: "Type de Service")
            Spacer()
            Label("12 Rue de la Brique - 75010 Paris", image: "Position")
            Spacer()
            Label("www.tajmahal.fr", image: "Globe")
            Spacer()
            Label("06 12 34 56 78", image: "Telephone")
        }
        .frame(width: myWidth, height: 0.2 * myHeight)//, alignment: .leading)
        .font(.custom(myFontName, size: 15 * dynamicFontSize))
        .fontWeight(.semibold)
        .foregroundStyle(.secondary)
    }

    var navigationButton: some View {
        NavigationLink(destination: MenuView()) {
            Text("Accéder au menu")
                .foregroundColor(.white)
                .font(.custom(myFontName, size: 20 * dynamicFontSize))
                .fontWeight(.bold)
        }
        .frame(width: myWidth, height: 0.06 * myHeight)
        .background(customRed)
        .cornerRadius(10)
        .padding(.bottom, 40)
    }

    private func labelRow(text: String, label: String, imageName: String) -> some View {
        HStack {
            Label(label, image: imageName)
            Spacer()
            Text(text)
        }
    }
}

#Preview {
    WelcomeView()
}
