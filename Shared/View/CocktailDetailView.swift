//
//  CocktailDetailView.swift
//  Mix & Mix
//
//  Created by 서광현 on 2022/02/22.
//

import SwiftUI

struct CocktailDetailView: View {
    @Environment(\.presentationMode) var presentation
    var cocktail: Drinks?
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.center, spacing: 9) {
            Text(cocktail?.strDrink ?? "No Cocktail Here")
                .font(.system(size: 20, weight: .semibold, design: .default))
            
            AsyncImage(url: cocktail?.urlImage) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(5/4, contentMode: .fit)
                } else {
                    ProgressView()
                        .frame(width: 100, height: 100)
                }
            }
            Spacer()
        }
        .navigationTitle("MIX & MIX")
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
    }
}

struct CocktailDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDetailView(cocktail: nil)
    }
}
