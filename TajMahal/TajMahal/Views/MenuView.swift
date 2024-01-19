//
//  MenuView.swift
//  TajMahal
//
//  Created by Kouassi Assoua on 19/01/2024.
//

import SwiftUI

struct MenuView: View {
    // Cette ligne pour annuler la présentation courante
    @Environment(\.dismiss) var dismiss
    
    // Référence vers le view model qui permet d'accéder aux tableaux d'entrées et de plats du menu
    let myViewModel: ViewModel = ViewModel()
    let dishType: [String] = ["Entrées", "Plats Principaux"]
    
    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width
            let myWidth = screenWidth - 30
            
            // Affichage de la liste des plats
            List {
                // Parcours des types de plats (entrées, plats principaux)
                ForEach(dishType, id: \.self) { type in
                    // Création des sections pour chaque type de plat
                    Section(header: Text(type)) {
                        // Appel d'une fonction pour générer le contenu de la section
                        menuContent(for: type, width: myWidth)
                    }
                }
            }
            //.frame(width: myWidth, alignment: .center)
            .navigationTitle("Menu") // Ajout du titre de la navigation
            .listRowSpacing(15.0) // Définition de l'espacement entre les rangées
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
            //.frame(width: myWidth, alignment: .center)
        }
    }

    // Fonction pour générer le contenu de la liste en fonction du type de plat
    @ViewBuilder
    private func menuContent(for type: String, width: CGFloat) -> some View {
        let height : Double = 100
        switch type {
        case "Entrées":
            // Création de la liste des entrées
            ForEach(myViewModel.apetizerArray, id: \.self) { dish in
                navigationLinkFor(dish).frame(width: width, height: height)
            }
        case "Plats Principaux":
            // Création de la liste des plats principaux
            ForEach(myViewModel.mainCourseArray, id: \.self) { dish in
                navigationLinkFor(dish).frame(height: height)
            }
        default:
            EmptyView() // Affichage d'une vue vide dans les autres cas
        }
    }

    // Fonction pour créer un NavigationLink pour chaque plat
    private func navigationLinkFor(_ dish: Dish) -> some View {
        NavigationLink {
            DishDetailsView(myDish: dish) // Vue détaillée du plat sélectionné
        } label: {
            ListView(myDish: dish) // Vue liste pour afficher le plat
        }
    }
}


#Preview {
    MenuView()
}
