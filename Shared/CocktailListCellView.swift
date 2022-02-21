//
//  CocktailListCellView.swift
//  Mix & Mix
//
//  Created by 서광현 on 2022/02/21.
//

import SwiftUI

struct CocktailListCellView: View {
    let cocktail: Drinks?
    let width: CGFloat?
    
    var body: some View {
        HStack {
            AsyncImage(url: cocktail?.urlImage) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: width ?? 100.0)
                    .aspectRatio(1, contentMode: .fit)
                    
                    .clipShape(
                        RoundedRectangle(cornerRadius: 10)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 5)
                            .foregroundColor(.gray.opacity(0.5))
                    )
                
            } placeholder: {
                ProgressView()
            }
     
            VStack(spacing: 5) {
                Text(cocktail?.strDrink ?? "No Cocktail")
                    .font(.system(size: 18, weight: .bold, design: .monospaced))
                Button("More Info") {
                    print("Not Yet..")
                }
            }
            .padding()
        }
        .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
    }}

struct CocktailListCellView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailListCellView(cocktail: nil, width: nil)
    }
}
