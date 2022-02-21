//
//  CocktailData.swift
//  Mix & Mix
//
//  Created by 서광현 on 2022/02/21.
//

import Foundation


class CocktailData: ObservableObject{
    @Published  var cocktailData: CocktailDataModel?
    
    init() {
        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                if let cocktailData = data {
                    let decodedData = try JSONDecoder().decode(CocktailDataModel.self, from: cocktailData)
                
                    
                DispatchQueue.main.async {
                    self.cocktailData = decodedData
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

