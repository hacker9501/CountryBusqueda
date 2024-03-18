//
//  CountryViewModel.swift
//  SearchCountry
//
//  Created by Elver Mayta Hernández on 19/02/24.
//

import Foundation

final class CountryViewModel: ObservableObject {
    
    @Published var country: [CountryModel] = []
    
    func getCountry() async {
        do {
            let fetchedCountry = try await NetworkCountry.getCountry()
            
            DispatchQueue.main.async {
                self.country = fetchedCountry
                print("Country data:", self.country)
            }
            
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
}




