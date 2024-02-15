//
//  MenuView.swift
//  TajMahal
//
//  Created by Kouassi Assoua on 19/01/2024.
//

import SwiftUI

struct MenuView: View {
    // Variable d'environnement pour gérer la fermeture de la vue
    @Environment(\.dismiss) var dismiss
    // ViewModel pour accéder aux données des plats
    let myViewModel: ViewModel = ViewModel()
    let dishType: [String] = ["Entrées", "Plats Principaux"]

    var body: some View {
        // NavigationStack pour la navigation entre les écrans
        // Liste des plats
        List {
            // Parcours des types de plats et création des sections
            ForEach(dishType, id: \.self) { type in
                Section(header: Text(type).textCase(nil).font(.custom(myFontName, size: 14)).background(customGray)) {
                    // Contenu de la section, défini dans une fonction séparée
                    menuContent(for: type)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .listStyle(.plain)
        .background(customGray)
        .navigationTitle("Menu") // Titre de la navigation
        .listRowSpacing(1)    // Espacement entre les rangées de la liste
        .navigationBarBackButtonHidden(true) // Masquer le bouton de retour par défaut
        .toolbar {
            // Bouton personnalisé pour le retour
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.primary)
                }
            }
        }
    }

    // Fonction pour générer le contenu de chaque section de menu
    @ViewBuilder
    private func menuContent(for type: String) -> some View {
        // Sélection des plats en fonction du type (entrées ou plats principaux)
        let dishes = type == "Entrées" ? myViewModel.apetizerArray : myViewModel.mainCourseArray
        // Création d'une vue pour chaque plat
        ForEach(dishes, id: \.self) { dish in
            navigationLinkFor(dish)
        }
    }

    // Fonction pour créer un NavigationLink pour chaque plat
    private func navigationLinkFor(_ dish: Dish) -> some View {
        ZStack { //Utilisation de la ZStack pour cacher le chevron de la ligne
            NavigationLink(destination: DishDetailsView(myDish: dish)) {
            }.opacity(0)
            ListRowView(myDish: dish)
        }
    }
}

#Preview {
    MenuView()
}


