//
//  ViewController.swift
//  SearchCountry
//
//  Created by Elver Mayta Hernández on 19/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var tableList: UITableView!

    var countryViewModel = CountryViewModel()
    var valorseleccionado: CountryModel?
    var displayedCountries: [CountryModel] = []
    //var searchCountryViewModel = SearchCountryViewModel()
    //var valorseleccionado1: CountrySearchModel?

    
    override func viewDidLoad()  {
        super.viewDidLoad()
        tableList.dataSource = self
        tableList.delegate = self
        search.delegate = self
        
        let nib = UINib(nibName: "CeldaViewCell", bundle: nil)
        tableList.register(nib, forCellReuseIdentifier: "CountryCell")
        
        fetchData()
    }

    func fetchData() {
        
//        Task {
//            await countryViewModel.getCountry()
//            DispatchQueue.main.async {
//                
//                self.tableList.reloadData()
//            }
//            
//        }
        Task {
            await countryViewModel.getCountry()
            displayedCountries = countryViewModel.country
            DispatchQueue.main.async {
                self.tableList.reloadData()
            }
        }
    }

    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // Implementar los métodos del protocolo UITableViewDataSource
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return displayedCountries.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CeldaViewCell else{
                fatalError("Unable to dequeue CustomTableViewCell")
            }
            
           
            let country = displayedCountries[indexPath.row]
            
            // Configurar la celda con los datos del país
            cell.nameLabel.text = country.name.common
            cell.banderaLabel.text = country.flag
            
//            if let flagImage = UIImage(named: country.flag) {
//                cell.imagenFlag.image = flagImage
//            } else {
//                print("No se pudo encontrar la imagen de la bandera para \(country.flag)")
//            }
            
            cell.selectionStyle = .none
            
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        valorseleccionado = displayedCountries[indexPath.row]
        
        performSegue(withIdentifier: "DetalleCountry", sender: self)
        
        //Deseleccionar
        tableList.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetalleCountry" {
            let viewCountry = segue.destination as! DetalleViewController
            viewCountry.detailCountry = valorseleccionado
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        Task {
            await filterCountries(with: searchText)
            DispatchQueue.main.async {
                self.tableList.reloadData()
            }
        }
    }

    private func filterCountries(with searchText: String) {
        if searchText.isEmpty {
            displayedCountries = countryViewModel.country
        } else {
            displayedCountries = countryViewModel.country.filter { country in
                return country.name.common.lowercased().contains(searchText.lowercased())
            }
        }
    }
}
