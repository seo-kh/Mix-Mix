//
//  ContentView.swift
//  Shared
//
//  Created by 서광현 on 2022/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isAlcohol: Bool = true
    @ObservedObject var alcoholCocktailData: CocktailData = CocktailData(from: Constant.cocktailURL)
    
    var alcoholCocktail: [Drink] { alcoholCocktailData.drinks.filter { $0.isAlcohol } }
    var nonAlcoholCocktail: [Drink] { alcoholCocktailData.drinks.filter { !$0.isAlcohol } }
    
    var body: some View {
        TabView(selection: $isAlcohol) {
            CocktailListView(drinks: alcoholCocktail)
                .tabItem() {
                    Label {
                        Text("Alcohol")
                            .font(.system(size: 12))
                            .onTapGesture {
                                isAlcohol.toggle()
                            }
                    } icon: {
                        isAlcohol ? Image(systemName: "drop.degreesign") : Image(systemName: "drop")
                    }
                }
                .tag(true)
            
            CocktailListView(drinks: nonAlcoholCocktail)
                .tabItem {
                    Label {
                        Text("Non-Alcohol")
                            .font(.system(size: 12))
                            .onTapGesture {
                                isAlcohol.toggle()
                            }
                    } icon: {
                        !isAlcohol ? Image(systemName: "drop.degreesign") : Image(systemName: "drop")
                    }
                }
                .tag(false)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
