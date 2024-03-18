//
//  NetworkSearchCountry.swift
//  SearchCountry
//
//  Created by Elver Mayta Hernández on 21/02/24.
//

import Foundation

class NetworkSearchCountry{
    
    @Published var name = ""
    @Published var capital = ""
    @Published var description = ""
    @Published var imagen = ""
    
//    static func getSearchCountry(name: String, completion: @escaping ([CountrySearchModel]?, Error?) -> Void) async {
//            let url = URL(string: "https://restcountries.com/v3.1/name/\(name)")!
//            let request = URLRequest(url: url)
//            print(url)
//            do {
//                let (data, _) = try await URLSession.shared.data(for: request)
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let searchResults = try decoder.decode([CountrySearchModel].self, from: data)
//                completion(searchResults, nil)
//                print(searchResults)
//            } catch {
//                completion(nil, error)
//            }
//        }
    
    func fetchName(id: Int){
        guard let url = URL(string: "https://restcountries.com/v3.1/name/\(id)") else { return  }
        
        print(url)
        URLSession.shared.dataTask(with: url){data,_,_ in
            
            guard let data = data else { return }
            do{
                let json = try JSONDecoder().decode([CountryModel].self, from: data)
                print(json)
                DispatchQueue.main.async {
                    self.name = json.first?.name.common ?? ""
                    self.capital = json.first?.capital?.description ?? ""
                    self.description = json.first?.flags.alt ?? ""
                    self.imagen = json.first?.coatOfArms.png ?? ""
                }
            }catch let error as NSError{
                print("Error en el json", error.localizedDescription)
            }
            
        }.resume()
    }
}
