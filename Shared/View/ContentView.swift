//
//  ContentView.swift
//  Shared
//
//  Created by 서광현 on 2022/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var alcoholCocktailData = CocktailData(from: Constant.alcoholicURL)
    @ObservedObject var nonAlcoholCocktailData = CocktailData(from: Constant.nonAlcoholicURL)
    var body: some View {
        TabView {
            CocktailListView(data: alcoholCocktailData)
                .tabItem {
                    Text("Alcohol")
                }
            
            CocktailListView(data: nonAlcoholCocktailData)
                .tabItem {
                    Text("Non-Alcohol")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
