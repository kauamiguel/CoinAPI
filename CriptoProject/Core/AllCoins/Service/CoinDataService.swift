//
//  CoinDataSercice.swift
//  CriptoProject
//
//  Created by Kaua Miguel on 02/08/24.
//

import Foundation


class CoinDataService{
    
    private let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=24h&locale=en"
    
    
    func fetchCoinsAsync() async throws -> [Coin]{
        
        guard let url = URL(string: urlString) else {return []}
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            let coins = try JSONDecoder().decode([Coin].self, from: data)
            return coins
        }catch{
            print(error.localizedDescription)
            return []
        }
        
       
        
    }
}




// MARK: - Completion and escaping function
extension CoinDataService{
    func fetchCoinsWithResult(completion : @escaping(Result<[Coin], CoinAPIError>) -> Void){
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error{
                completion(.failure(.unknownError(error: error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed(description: "Request Failed")))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            
            do{
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                completion(.success(coins))
            }catch{
                completion(.failure(.jsonParsingFailure))
            }
            
            
        }.resume()
    }
}
