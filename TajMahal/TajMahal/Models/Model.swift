//
//  Model.swift
//  TajMahal
//
//  Created by Amandine Cousin on 31/10/2023.
//

import Foundation
import SwiftUI

// Cette enumération répertorie 3 niveaux de piment
enum SpiceLevel {
    case light
    case medium
    case hot
}

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

//Cette extension permet de créer une couleur spécifique pour le client
extension Color {
    init(rgbRed: Double, green: Double, blue: Double) {
        self.init(red: rgbRed / 255.0, green: green / 255.0, blue: blue / 255.0)
    }
}


let exampleDish = Dish(name: "Samousas aux légumes", description: "Agneau mijoté dans une sauce épicée", allergens: "Ail, oignon", ingredients: "Agneau, oignons, ail, gingembre, poudre de curcuma, poudre de cumin, poudre de coriandre, piment en poudre, tomates en purée, huile, coriandre fraîche", spiceLevel: .hot, imageName: "Tikka Masala", price: "11,00€")



