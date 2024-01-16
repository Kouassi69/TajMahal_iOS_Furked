//
//  Model.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import Foundation

// Cette enumération répertorie 3 niveaux de piment
enum SpiceLevel {
    case light
    case medium
    case hot
}

/*
//Cette énumération permet de catégoriser un plat ou une entrée
enum Catergory {
    case 
} */

// Représente l'objet "plat", qui figure sur la carte du menu
struct Dish : Hashable {
    var name: String
    var description: String
    var allergens: String
    var ingredients: String
    var spiceLevel: SpiceLevel
    var imageName: String
    var price: String
}

//Cette extension permet de gérer le formalistme des titres des sessions pour se conformer à la maquette
extension String {
    var capitalizedModelisation: String {
        // 1
        let firstLetter = self.prefix(1).capitalized
        // 2
        let remainingLetters = self.dropFirst().lowercased()
        // 3
        return firstLetter + remainingLetters
    }
}

//Fonction pour définir le niveau d'épice pour chaque plat
func SpicyLevel() -> Int {
    
    
    return 1
}
