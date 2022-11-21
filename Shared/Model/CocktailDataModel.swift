//
//  CocktailDataModel.swift
//  Mix & Mix
//
//  Created by 서광현 on 2022/02/21.
//

import Foundation
import Combine


class CocktailData: ObservableObject{
    @Published  var drinks: [Drink] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(from url: URL? = Constant.cocktailURL) {
        if let url = url {
            loadDataPublisher(url)
        }
    }
    
    func loadDataPublisher(_ url: URL) {
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryCompactMap(self.jsonSerialization)
            .map(self.mappingDrink)
            .sink { completion in
                switch completion {
                case .finished:
                    print("well done")
                case .failure(let error):
                    print("Error Decoding.. \(error)")
                }
            } receiveValue: { [weak self] drinks in
                self?.drinks = drinks
            }
            .store(in: &cancellables)
    }
}

extension CocktailData {
    private func jsonSerialization(_ data: Data, _ response: URLResponse) throws -> [[String: Any]]? {
        if let response = response as? HTTPURLResponse {
            switch response.statusCode {
            case 100..<200:
                throw URLError(.timedOut)
            case 200..<300:
                return try? JSONSerialization.jsonObject(with: data) as? [[String: Any]]
            case 300..<400:
                throw URLError(.redirectToNonExistentLocation)
            case 400..<500:
                throw URLError(.dataNotAllowed)
            case 500..<600:
                throw URLError(.badServerResponse)
            default:
                throw URLError(.unknown)
            }
        } else {
            return nil
        }
    }
    
    private func mappingDrink(_ json: [[String: Any]]) -> [Drink] {
        json.compactMap { ele -> Drink? in
            guard let drinkIngredients = ele["drinkIngredients"] as? [String],
                  let drinkMeasures = ele["drinkMeasures"] as? [String],
                  let drinkName = ele["drinkName"] as? String,
                  let drinkCategory = ele["drinkCategory"] as? String,
                  let drinkGlass = ele["drinkGlass"] as? String,
                  let drinkInstructions = ele["drinkInstructions"] as? String,
                  let _id = ele["_id"] as? String,
                  let alcohol = ele["alcohol"] as? String,
                  let drinkThumb = ele["drinkThumb"] as? String else {
                return nil
            }
            return Drink(
                drinkIngredients: drinkIngredients,
                drinkMeasures: drinkMeasures,
                drinkName: drinkName,
                drinkCategory: drinkCategory,
                drinkGlass: drinkGlass,
                drinkInstructions: drinkInstructions,
                drinkThumb: drinkThumb,
                _id: _id,
                alcohol: alcohol
            )
        }
    }
    
}
