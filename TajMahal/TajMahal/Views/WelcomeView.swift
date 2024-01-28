//
//  WelcomeView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//
/* CECI EST MON CODE D'ORIGINE AVANT OPTIMISATION PAR CHAT GPT
 import SwiftUI
 
 // Page d'accueil
 struct WelcomeView: View {
 
 var body: some View {
 //Je récupère les dimensions de l'écran
 GeometryReader { geometry in
 let screenWidth = geometry.size.width
 //let screenHeight = geometry.size.width
 let myWidth = screenWidth - 30
 
 NavigationStack {
 Image("TajMahal")
 .resizable()
 .frame(width: myWidth, height: 400)
 .scaledToFit()
 .padding(.top)
 
 HStack {
 VStack (alignment: .leading) {
 Text("Restaurant Indien")
 .foregroundStyle(.secondary)
 .font(.system(size: 12, weight: .regular, design: .default))
 Spacer()
 Text("Taj Mahal")
 .foregroundStyle(.primary)
 .font(.system(size: 18, weight: .bold, design: .default))
 }
 Spacer()
 Image("Logo") // Obligé d'utiliser cette image car l'image logo ne parge pas
 .resizable()
 .scaledToFit()
 .foregroundStyle(.secondary)
 }
 .frame(width: myWidth, height: 40)
 .padding(40)
 
 VStack(alignment: .leading, content: {
 HStack {
 Label("Mardi", systemImage: "clock")
 Spacer()
 Text("11h30 - 14h30 . 18h30 - 22h00")
 }
 Spacer()
 HStack {
 Label("Type de service", systemImage: "trash")
 Spacer()
 Text("A emporter")
 }
 Spacer()
 Label("12 Rue de la Brique - 75010 Paris", systemImage: "mappin.and.ellipse")
 Spacer()
 Label("www.tajmahal.fr", systemImage: "globe")
 Spacer()
 Label("06 12 34 56 78", systemImage: "phone")
 
 })
 .font(.system(size: 14, weight: .light, design: .default))
 .foregroundStyle(.secondary)
 .frame(width: myWidth, height: 130, alignment: .leading)
 
 
 NavigationLink {
 MenuView()
 } label : {
 Text("Acceder au menu")
 .foregroundStyle(.white)
 }
 .frame(width: myWidth, height: 40, alignment: .center)
 .background(Color(rgbRed: 191, green: 62, blue: 55)) // Utilisation de la couleur personnalisée sur le bouton
 .clipShape(.rect(cornerSize: CGSize(width: 10.0, height: 10.0)))
 .padding(40)
 }
 .padding(.top, 20)
 }
 }
 }
 
 #Preview {
 WelcomeView()
 } */

import SwiftUI

struct WelcomeView: View {
    
    
    /*init() {
     // Imprimer les dimensions de l'écran dans la console
     print("Largeur de l'écran: \(UIScreen.main.bounds.width), Hauteur de l'écran: \(UIScreen.main.bounds.height)")
     }*/
    
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
                
                navigationButton
            }
            .padding(.horizontal, 15)
            .padding(.top, 15)
        }
    }
    
    var restaurantInfo: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Restaurant Indien")
                    .font(.custom(myFontName, size: 16 * dynamicFontSize))
                //.font(.system(size: 16 * dynamicFontSize, weight: .light, design: .default))
                    .foregroundStyle(.secondary)
                //.font(.subheadline)
                Spacer()
                Text("Taj Mahal")
                //.font(.system(size: 25 * dynamicFontSize, weight: .semibold, design: .default))
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
        .frame(height: 0.05 * myHeight)
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
        .frame(width: myWidth, height: 0.18 * myHeight, alignment: .leading)
        .font(.custom(myFontName, size: 16 * dynamicFontSize))
        .fontWeight(.semibold)
        //.font(.system(size: 18 * dynamicFontSize, weight: .light, design: .default))
        .foregroundStyle(.secondary)
        
    }
    
    var navigationButton: some View {
        NavigationLink(destination: MenuView()) {
            Text("Accéder au menu")
                .foregroundColor(.white)
                .font(.custom(myFontName, size: 22 * dynamicFontSize))
                .fontWeight(.bold)
            //.font(.system(size: 20 * dynamicFontSize, weight: .regular, design: .default))
        }
        .frame(width: myWidth, height: 0.07 * myHeight)
        .background(customRed)
        .cornerRadius(10)
        .padding(40)
    }
    
    private func labelRow(text: String, label: String, imageName: String) -> some View {
        //print(myWidth)
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
