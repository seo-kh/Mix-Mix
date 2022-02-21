//
//  CocktailData.swift
//  Mix & Mix
//
//  Created by 서광현 on 2022/02/21.
//

import Foundation


class CocktailData: ObservableObject{
    let url: URL
    @Published  var cocktailData: [Drinks]?
    var sample = Drinks(
        strDrink: "1-900-FUK-MEUP",
        strDrinkThumb: "https://www.thecocktaildb.com/images/media/drink/uxywyw1468877224.jpg",
        idDrink: "15395"
    )
    
    init(from url: URL) {
        self.url = url
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                if let cocktailData = data {
                    let decodedData = try JSONDecoder().decode(CocktailDataModel.self, from: cocktailData)
                DispatchQueue.main.async {
                    self.cocktailData = decodedData.drinks
                }
                }
                else {
                    print("No data")
                }
            } catch {
                print("Error")
            }
        }.resume()
        
    }
}
