//
//  DetalleViewController.swift
//  SearchCountry
//
//  Created by Elver Mayta Hernández on 21/02/24.
//

import UIKit

class DetalleViewController: UIViewController {
    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var imagenCountry: UIImageView!
    @IBOutlet weak var descriptionCountry: UITextView!
    @IBOutlet weak var country: UILabel!
    
    var detailCountry: CountryModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            country.text = detailCountry?.name.common
            capital.text = detailCountry?.capital?.first?.description
            
            if let altText = detailCountry?.flags.alt {
                descriptionCountry.text = altText
            } else {
                descriptionCountry.text = "Valor Predeterminado"
            }
            
            if let urlString = detailCountry?.coatOfArms.png, let url = URL(string: urlString) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.imagenCountry.image = image
                        }
                    }
                }.resume()
            }
        
    }
    
    
}
