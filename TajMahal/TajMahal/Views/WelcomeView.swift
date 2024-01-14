//
//  WelcomeView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

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
                //Spacer()
                HStack {
                    VStack (alignment: .leading) {
                        Text("Restaurant Indien")
                            .foregroundStyle(.secondary)
                            .font(.system(size: 12, weight: .thin, design: .default))
                        Text("Taj Mahal")
                            .foregroundStyle(.primary)
                            .font(.system(size: 18, weight: .bold, design: .default))
                    }
                    Spacer()
                    Image("TajMahal") // Obligé d'utiliser cette image car l'image logo ne parge pas
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.red)
                }
                .frame(width: myWidth, height: 40)
                .padding(40)
    
               //Spacer()
                
                VStack (alignment: .leading, content: {
                    HStack {
                        VStack(alignment: .leading, content: {
                            Label("Mardi", systemImage: "clock")//.foregroundStyle(.red)
                            Spacer()
                            Label("Type de service", systemImage: "trash")
                        })
                        VStack(alignment: .trailing, content: {
                            Text("11h30 - 14h30 . 18h30 - 22h00")
                            Spacer()
                            Text("A emporter")
                        })
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
                .frame(width: myWidth, height: 50)
                .padding()
                
                NavigationLink {
                    MenuView()
                } label : {
                    Text("Acceder au Menu")
                        .foregroundStyle(.white)
                }
                .frame(width: myWidth, height: 40, alignment: .center)
                .background(Color.red)//(Color(red: 191, green: 0, blue: 55))
                .clipShape(.rect(cornerSize: CGSize(width: 10.0, height: 10.0)))
                .padding(40)
            }
            .padding(.top, 10)
        }
        
        
        
        
    }
}

#Preview {
    WelcomeView()
}
