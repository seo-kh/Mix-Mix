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
        let sample = data.cocktailData?.drinks[0]
        
        CocktailListCellView(cocktail: sample, width: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
