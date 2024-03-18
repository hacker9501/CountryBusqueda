//
//  NetworkCountry.swift
//  SearchCountry
//
//  Created by Elver Mayta Hernández on 19/02/24.
//

import Foundation

class NetworkCountry {
    
    static func getCountry() async -> [CountryModel] {
        let url = URL(string: "https://restcountries.com/v3.1/all")!
        let request = URLRequest(url: url)  // Crear un URLRequest con la URL
        print(url)
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            print(data)
            return try decoder.decode([CountryModel].self, from: data)
        } catch {
            // Manejar el error apropiadamente en tu aplicación
            print("Error: \(error)")  // Imprimir el error aquí
            fatalError("Error al obtener datos: \(error)")
        }
    }
}

