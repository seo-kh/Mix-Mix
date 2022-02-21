//
//  CocktailListView.swift
//  Mix & Mix
//
//  Created by 서광현 on 2022/02/22.
//

import SwiftUI

struct CocktailListView: View {
    @ObservedObject var data: CocktailData
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

struct CocktailListView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailListView(data: CocktailData(from: Constant.nonAlcoholicURL))
    }
}
