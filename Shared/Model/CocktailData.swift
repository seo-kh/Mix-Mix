//
//  CocktailData.swift
//  Mix & Mix
//
//  Created by 서광현 on 2022/02/21.
//

import Foundation


struct Drink: Identifiable, Decodable {
    let drinkIngredients: [String]
    let drinkMeasures: [String]
    let drinkName: String
    let drinkCategory: String
    let drinkGlass: String
    let drinkInstructions: String
    
    let drinkThumb: String
    let _id: String
    let alcohol: String
    
    var id: String { _id }
    var isAlcohol: Bool { alcohol == "true" ? true : false }
    var drinkImage: URL? { URL(string: drinkThumb) }
}
    
