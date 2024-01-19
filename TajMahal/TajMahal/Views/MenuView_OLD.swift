//
//  MenuView.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//
/*
import SwiftUI

// Menu sous forme de liste
struct MenuView: View {
    //Cette ligne pour annuler la présentation courante
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
                        case "Entrées": // On crée la section pour les entrées
                            ForEach(myViewModel.apetizerArray, id: \.self) { dish in
                                NavigationLink {
                                    DishDetailsView()
                                } label: {
                                    ListView(myDish: dish)
                                }
                            }
                        case "Plats Principaux": //On crée la section pour les plats principaux
                            ForEach(myViewModel.mainCourseArray, id: \.self) { dish in
                                NavigationLink {
                                    DishDetailsView()
                                } label: {
                                    ListView(myDish: dish)
                                }
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


#Preview {
    MenuView()
}

*/
/*
import SwiftUI

struct MenuView: View {
    // Cette ligne pour annuler la présentation courante
    @Environment(\.dismiss) var dismiss
    
    // Référence vers le view model qui permet d'accéder aux tableaux d'entrées et de plats du menu
    let myViewModel: ViewModel = ViewModel()
    let dishType: [String] = ["Entrées", "Plats Principaux"]
    
    var body: some View {
        // Affichage de la liste des plats
        List {
            // Parcours des types de plats (entrées, plats principaux)
            ForEach(dishType, id: \.self) { type in
                // Création des sections pour chaque type de plat
                Section(header: Text(type)) {
                    // Appel d'une fonction pour générer le contenu de la section
                    menuContent(for: type)
                }
            }
        }
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
    }

    // Fonction pour générer le contenu de la liste en fonction du type de plat
    @ViewBuilder
    private func menuContent(for type: String) -> some View {
        switch type {
        case "Entrées":
            // Création de la liste des entrées
            ForEach(myViewModel.apetizerArray, id: \.self) { dish in
                navigationLinkFor(dish)
            }
        case "Plats Principaux":
            // Création de la liste des plats principaux
            ForEach(myViewModel.mainCourseArray, id: \.self) { dish in
                navigationLinkFor(dish)
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


struct ContentView: View {
    var body: some View {
        MenuView()
    }
}*/
