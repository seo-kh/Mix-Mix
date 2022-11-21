//
//  CocktailDetailView.swift
//  Mix & Mix
//
//  Created by 서광현 on 2022/02/22.
//

import SwiftUI

struct CocktailDetailView: View {
    @Environment(\.presentationMode) var presentation
    var drink: Drink
    
    var body: some View {
        List {
            Text(drink.drinkName)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .center)
            
            AsyncImage(url: drink.drinkImage) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(5/4, contentMode: .fit)
                        .cornerRadius(20.0)
                } else {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
            }
            
            Section {
                Text("\(drink.alcohol)".uppercased()).tint(.accentColor)
            } header: {
                Text("Alcohol")
            }
            
            Section {
                Text(drink.drinkInstructions)
                    .font(.body)
                
            } header: {
                Text("Instructions")
            }
            
            Section {
                Text(drink.drinkCategory)
                
            } header: {
                Text("Category")
            }
            
            Section {
                Text(drink.drinkGlass)
                
            } header: {
                Text("Glass")
            }
            
            Section {
                Text(drink.drinkMeasures.enumerated().map{"- \($1)\n"}.joined().dropLast(2))
                    .font(.callout)
            } header: {
                Text("Measures")
            }
            
            
            Section {
                Text(drink.drinkIngredients.enumerated().map{"- \($1)\n"}.joined().dropLast(2))
                    .font(.callout)
            } header: {
                Text("Ingredients")
            }
        }
        .navigationTitle("MIX & MIX")
        .listRowSeparator(.hidden)
        #if os(iOS)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    self.presentation.wrappedValue.dismiss()
                } label: {
                    Label("Prev", systemImage: "chevron.left")
                        .labelStyle(.titleAndIcon)
                }
                
            }
        }
        #endif
    }
}
