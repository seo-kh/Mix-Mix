//
//  CocktailListCellView.swift
//  Mix & Mix
//
//  Created by 서광현 on 2022/02/21.
//

import SwiftUI

struct CocktailListCellView: View {
    let drink: Drink?
    let customSize: CGFloat?
    
    var body: some View {
        HStack(alignment: VerticalAlignment.top, spacing: 5) {
            AsyncImage(url: drink?.drinkImage) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: customSize ?? 100.0, height: customSize ?? 100.0)
                    .aspectRatio(1, contentMode: .fit)
                    
                    .clipShape(
                        RoundedRectangle(cornerRadius: 10)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .foregroundColor(.gray.opacity(0.5))
                    )
                    .padding(EdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 0))
                
            } placeholder: {
                ProgressView()
                    .frame(
                        width: customSize ?? 100.0,
                        height: customSize ?? 100.0
                    )
            }
     
            VStack(alignment: HorizontalAlignment.leading,spacing: 5) {
                Text(drink?.drinkName ?? "No Cocktail")
                    .font(.body)
                    .lineLimit(2)
                    
                Text(drink?.drinkInstructions ?? "No Instructions")
                    .font(.caption)
                    .lineLimit(2)
            }
            .padding()
        }
        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
    }
}
