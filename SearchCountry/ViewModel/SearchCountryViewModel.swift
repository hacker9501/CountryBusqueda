//
//  SearchCountryViewModel.swift
//  SearchCountry
//
//  Created by Elver Mayta Hernández on 21/02/24.
//

import Foundation

import Foundation

class SearchCountryViewModel: ObservableObject {
    private var networkSearchCountry = NetworkSearchCountry()
    
    func fetchCountryDetails(id: Int) {
        networkSearchCountry.fetchName(id: id)
    }
    
    // Otros métodos de ViewModel relacionados con la lógica de tu aplicación
}
