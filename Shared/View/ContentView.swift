//
//  ContentView.swift
//  Shared
//
//  Created by 서광현 on 2022/02/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var data = CocktailData()
    var body: some View {
        NavigationView {
            List{
                ForEach(data.cocktailData ?? [data.sample]) {
                    cocktail in
                    NavigationLink {
                        CocktailDetailView(cocktail: cocktail)
                    } label: {
                        CocktailListCellView(cocktail: cocktail, customSize: 100)
                    }

                }
            }
            .navigationTitle("MIX & MIX")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
