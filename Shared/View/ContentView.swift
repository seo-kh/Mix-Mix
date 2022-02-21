//
//  ContentView.swift
//  Shared
//
//  Created by 서광현 on 2022/02/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isAlcohol: Bool = true
    @ObservedObject var alcoholCocktailData: CocktailData = CocktailData(from: Constant.alcoholicURL)
    @ObservedObject var nonAlcoholCocktailData: CocktailData = CocktailData(from: Constant.nonAlcoholicURL)
    
    var body: some View {
        TabView(selection: $isAlcohol) {
            CocktailListView(data: alcoholCocktailData)
                .tabItem() {
                    Label {
                        Text("Alcohol")
                            .font(.system(size: 12))
                            .onTapGesture {
                                isAlcohol.toggle()
                            }
                    } icon: {
                        isAlcohol ? Image("alcohol") : Image("blank-cocktail")
                    }
                }
                .tag(true)
            
            
            
            
            
            CocktailListView(data: nonAlcoholCocktailData)
                .tabItem {
                    Label {
                        Text("Non-Alcohol")
                            .font(.system(size: 12))
                            .onTapGesture {
                                isAlcohol.toggle()
                            }
                    } icon: {
                        !isAlcohol ? Image("non-alcohol") : Image("blank-cocktail")
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
