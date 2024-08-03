//
//  ContentView.swift
//  CriptoProject
//
//  Created by Kaua Miguel on 02/08/24.
//

import SwiftUI

struct CoinView: View {
    @StateObject var viewModel = CoinsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.coins){ coin in
                HStack(spacing: 12){
                    Text("\(coin.marketCapRank)")
                        .foregroundStyle(.gray)
                    
                    VStack(alignment : .leading, spacing: 4){
                        Text(coin.name)
                            .fontWeight(.semibold)
                        
                        Text(coin.symbol.uppercased())
                    }
                }
            }
        }
        .overlay {
            if let errorMessage = viewModel.errorMessage{
                Text(errorMessage)
            }
        }
    }
}

#Preview {
    CoinView()
}
