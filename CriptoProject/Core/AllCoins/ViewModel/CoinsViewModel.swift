//
//  CoinsViewModel.swift
//  CriptoProject
//
//  Created by Kaua Miguel on 02/08/24.
//

import Foundation
import SwiftUI

class CoinsViewModel : ObservableObject{
    
    @Published var coins = [Coin]()
    @Published var errorMessage : String?
    
    private let service = CoinDataService()
    
    init() {
        Task{
            try await fetchAsync()
        }
    }
    
    
    func fetchAsync() async throws{
        self.coins = try await service.fetchCoinsAsync()
    }
    
    func fetchCoinsWithCompletion(){
        service.fetchCoinsWithResult { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let coins):
                    self.coins = coins
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }

            }
        }
    }

}
