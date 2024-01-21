//
//  WelcomeView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//
/*
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
    let myWidth: CGFloat = 0.93 * UIScreen.main.bounds.width //Pour adapter le ratio des vues à l'écran
    let myHeight: CGFloat = 0.93 * UIScreen.main.bounds.height
    let customRed = Color(rgbRed: 191, green: 62, blue: 55)

    var body: some View {
        
       /* GeometryReader(content: { geometry in
            Text("\(geometry.size.width)")
            Text("\(geometry.size.height)").onAppear {
                // Imprimer les dimensions de la ligne
                print("Dimensions : \(geometry.size.width), & height : \(geometry.size.height)")
            }
        })*/
        
        NavigationStack {
            VStack {
                Image("TajMahal")
                    .resizable()
                    .frame(width: myWidth, height: 0.5 * myHeight)
                    .scaledToFit()
                    .padding()

                restaurantInfo
                    .padding(.vertical)

                restaurantDetails

                navigationButton
            }
            .padding(.horizontal, 15)
            .padding(.top, 25)
        }
    }

    var restaurantInfo: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Restaurant Indien")
                    .font(.system(size: 14, weight: .light, design: .default))
                    .foregroundStyle(.secondary)
                Spacer()
                Text("Taj Mahal")
                    .font(.system(size: 25, weight: .bold, design: .default))
            }
            Spacer()
            Image("Logo")
                .resizable()
                .scaledToFit()
                .foregroundStyle(Color.secondary)
                //.tint(.green)
                //.opacity(1)
                //.overlay(Color.red.opacity(0.5))
                .colorMultiply(.secondary)
                //.background(Color.blue)
        }
        .frame(height: 0.07 * myHeight)
        //.background(Color.red)
    }

    var restaurantDetails: some View {
        VStack(alignment: .leading) {
            labelRow(text: "11h30 - 14h30 . 18h30 - 22h00", label: "Mardi", imageName: "clock")
            Spacer()
            labelRow(text: "A emporter", label: "Type de service", imageName: "trash")
            Spacer()
            Label("12 Rue de la Brique - 75010 Paris", systemImage: "mappin.and.ellipse")
            Spacer()
            Label("www.tajmahal.fr", systemImage: "globe")
            Spacer()
            Label("06 12 34 56 78", systemImage: "phone")
        }
        .font(.system(size: 14, weight: .light, design: .default))
        .foregroundStyle(.secondary)
        .frame(width: myWidth, height: 0.2 * myHeight, alignment: .leading)
    }

    var navigationButton: some View {
        NavigationLink(destination: MenuView()) {
            Text("Acceder au menu")
                .foregroundColor(.white)
        }
        .frame(width: myWidth, height: 0.07 * myHeight)
        .background(customRed)
        .cornerRadius(10)
        .padding(40)
    }

    private func labelRow(text: String, label: String, imageName: String) -> some View {
        HStack {
            Label(label, systemImage: imageName)
            Spacer()
            Text(text)
        }
    }
}

#Preview {
    WelcomeView()
}
