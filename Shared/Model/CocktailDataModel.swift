//
//  CocktailDataModel.swift
//  Mix & Mix
//
//  Created by 서광현 on 2022/02/21.
//

import Foundation

struct CocktailDataModel: Decodable {
    var drinks: [Drinks]
}

struct Drinks: Decodable, Identifiable {
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
    
    var id: String {
        return idDrink
    }
    
    var urlImage: URL {
        return URL(string: strDrinkThumb)!
    }
}
