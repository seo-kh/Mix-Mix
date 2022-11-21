//
//  CocktailListView.swift
//  Mix & Mix
//
//  Created by 서광현 on 2022/02/22.
//

import SwiftUI

struct CocktailListView: View {
    var drinks: [Drink]
    
    var body: some View {
        NavigationView {
            List{
                ForEach(drinks) {
                    drink in
                    NavigationLink {
                        CocktailDetailView(drink: drink)
                    } label: {
                        CocktailListCellView(drink: drink, customSize: 100)
                    }

                }
            }
            .navigationTitle("MIX & MIX")
            #if os(iOS)
            .navigationBarTitleDisplayMode(.large)
            #endif
        }
    }
}

