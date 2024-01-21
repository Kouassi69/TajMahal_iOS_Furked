//
//  MenuView.swift
//  TajMahal
//
//  Created by Kouassi Assoua on 19/01/2024.
//
/* MON CODE*/
/*
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
            // Affichage de la liste des plats
            List {
                // Parcours des types de plats (entrées, plats principaux)
                ForEach(dishType, id: \.self) { type in
                    // Création des sections pour chaque type de plat
                    Section(header: Text(type).textCase(nil)) {
                        // Appel d'une fonction pour générer le contenu de la section
                        menuContent(for: type, width: screenWidth)
                    }
                }
            }
            //.padding(.horizontal, 15)
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
        }
    }

    // Fonction pour générer le contenu de la liste en fonction du type de plat
    @ViewBuilder
    private func menuContent(for type: String, width: CGFloat) -> some View {
        //let height : CGFloat = 80
        let lineWidth : CGFloat = width - 40
        let imageWidth : CGFloat = lineWidth / 3
        
        switch type {
        case "Entrées":
            // Création de la liste des entrées
            ForEach(myViewModel.apetizerArray, id: \.self) { dish in
                //navigationLinkFor(dish, )
                navigationLinkFor(dish, lineWidth: lineWidth, imageWidth: imageWidth)
                    //.background(Color.black)
                    //.frame(height: height)
                    //.padding(10)
                   // .frame(width : width, height: height)
            }
        case "Plats Principaux":
            // Création de la liste des plats principaux
            ForEach(myViewModel.mainCourseArray, id: \.self) { dish in
                //navigationLinkFor(dish)
                navigationLinkFor(dish, lineWidth: lineWidth, imageWidth: imageWidth)//.padding(.horizontal)
                    //.frame(width: width, height: height)
            }
        default:
            EmptyView() // Affichage d'une vue vide dans les autres cas
        }
    }

    // Fonction pour créer un NavigationLink pour chaque plat
    private func navigationLinkFor(_ dish: Dish, lineWidth: CGFloat, imageWidth: CGFloat) -> some View {
        //GeometryReader { geometry in
            NavigationLink {
                DishDetailsView(myDish: dish).frame(alignment: .center) // infos du plat sélectionné
            } label: {
                ListRowView(myDish: dish, lineWidth: lineWidth, imageWidth: imageWidth) // Vue liste pour afficher le plat
                    //.frame(alignment: .center)
                    /*.onAppear {
                        // Imprimer les dimensions de la ligne
                        print("Dimensions de la ligne = width : \(geometry.size.width), & height : \(geometry.size.height)")
                    }
            }*/
        }
        .frame(height: 100, alignment: .center)
        //.background(Color.blue)
        //.padding()
    }

}


#Preview {
    MenuView()
} */

/* CODE OPTIMISE PAR GPT*/
import SwiftUI

struct MenuView: View {
    // Variable d'environnement pour gérer la fermeture de la vue
    @Environment(\.dismiss) var dismiss
    
    // ViewModel pour accéder aux données des plats
    let myViewModel: ViewModel = ViewModel()
    let dishType: [String] = ["Entrées", "Plats Principaux"]
    
    // Calcul de la largeur de la ligne et de l'image en fonction de la largeur de l'écran
    let screenWidth = UIScreen.main.bounds.width
    let lineWidth: CGFloat
    let imageWidth: CGFloat

    // Initialisateur pour calculer lineWidth et imageWidth
    init() {
        lineWidth = screenWidth - 40 // Laisser un padding de 40 points (20 de chaque côté)
        imageWidth = lineWidth / 3   // Diviser la ligne en 3 pour l'image
    }

    var body: some View {
        // NavigationStack pour la navigation entre les écrans
        NavigationStack {
            // Liste des plats
            List {
                // Parcours des types de plats et création des sections
                ForEach(dishType, id: \.self) { type in
                    Section(header: Text(type).textCase(nil)) {
                        // Contenu de la section, défini dans une fonction séparée
                        menuContent(for: type)
                    }
                }
            }
            .navigationTitle("Menu") // Titre de la navigation
            .listRowSpacing(15.0)    // Espacement entre les rangées de la liste
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
        NavigationLink(destination: DishDetailsView(myDish: dish)) {
            // Affichage personnalisé pour chaque plat
            ListRowView(myDish: dish, lineWidth: lineWidth, imageWidth: imageWidth)
        }
        .frame(height: 100) // Hauteur fixe pour chaque élément de la liste
    }
}

#Preview {
        MenuView()
}


