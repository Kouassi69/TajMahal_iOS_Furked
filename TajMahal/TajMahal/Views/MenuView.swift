//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import SwiftUI

// Menu sous forme de liste
struct MenuView: View {
    //Cett eligne pour annuler la présentation courante
    @Environment(\.dismiss) var dismiss
    
    // Référence vers le view model qui permet d'accéder aux tableaux d'entrées et de plats du menu
    let myViewModel: ViewModel = ViewModel()
    let dishType: [String] = ["Entrées", "Plats Principaux"]
    
    var body: some View {
        
        /*
         List {
         // Version "if" : Je crée les sections "Entrée" et "Repas" et les lignes correspondantes pour un remplissage à partir de myViewModel
         ForEach(dishType, id: \.self) { type in
         Section(header: Text(type)) {
         if type == "Entrées" {
         ForEach(myViewModel.apetizerArray, id: \.self) { dish in
         ListView(myDish: dish)
         }
         } else {
         ForEach(myViewModel.mainCourseArray, id: \.self) { dish in
         ListView(myDish: dish)
         }
         }
         }
         }
         } */
        
        List {
            // Version "switch" : Je crée les sections "Entrée" et "Repas" et les lignes correspondantes pour un remplissage à partir de myViewModel
            ForEach(dishType, id: \.self) { type in
                Section(header: Text(type)) {
                    Group {
                        switch type {
                        case "Entrées":
                            ForEach(myViewModel.apetizerArray, id: \.self) { dish in
                                var spicyLevel = getSpicyFunc(spice: dish.spiceLevel)
                                
                                ListView(myDish: dish)
                            }
                        case "Plats Principaux":
                            ForEach(myViewModel.mainCourseArray, id: \.self) { dish in
                                ListView(myDish: dish)
                            }
                        default:
                            EmptyView() // On crée une liste vide
                        }
                    }
                }
            }
        }
        .navigationTitle("Menu") //Ajout du titre
        .listRowSpacing(15.0)
        .navigationBarBackButtonHidden(true) //Cacher le button existant
        .toolbar { //Configuration du nouveau button de retour
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss() //Action de retour
                }) {
                    Image(systemName: "chevron.backward") //config du nouveau bouton "Image" avec sa nouvelle image
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

func getSpicyFunc(spice: SpiceLevel) -> Int {
    var spicy : Int
    switch spice {
    case .hot : spicy = 3
    case .medium : spicy = 2
    case .light : spicy = 1
    }
    return spicy
}


#Preview {
    MenuView()
}



