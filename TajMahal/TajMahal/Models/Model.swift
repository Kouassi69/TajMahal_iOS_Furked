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
    func capitalizedFirstLetter() -> String {
        return self.capitalized(with: Locale.current)
    }
}

