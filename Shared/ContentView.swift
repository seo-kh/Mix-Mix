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
            List(data.cocktailData ?? [data.sample]) { item in
                CocktailListCellView(cocktail: item, customSize: 80)
            }
            .navigationTitle("MIX & MIX")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
