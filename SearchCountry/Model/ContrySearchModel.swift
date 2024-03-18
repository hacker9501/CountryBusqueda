//
//  ContryListModel.swift
//  SearchCountry
//
//  Created by Elver Mayta Hernández on 19/02/24.
//

import Foundation

// MARK: - Element
struct CountrySearchModel: Codable {
    let name: Names
    let tld: [String]
    let cca2, ccn3, cca3, cioc: String
    let independent: Bool
    let status: String
    let unMember: Bool
    let currencies: Currenciess
    let idd: Idds
    let capital, altSpellings: [String]
    let region, subregion: String
    let languages: Language
    let translations: [String: Trans]
    let latlng: [Int]
    let landlocked: Bool
    let borders: [String]
    let area: Int
    let demonyms: Demonymss
    let flag: String
    let maps: Map
    let population: Int
    let gini: Gini
    let fifa: String
    let car: Cars
    let timezones, continents: [String]
    let flags: Flagss
    let coatOfArms: CoatOfArmss
    let startOfWeek: String
    let capitalInfo: CapitalInfor
    let postalCode: PostCode
}

// MARK: - CapitalInfo
struct CapitalInfor: Codable {
    let latlng: [Double]
}

// MARK: - Car
struct Cars: Codable {
    let signs: [String]
    let side: String
}

// MARK: - CoatOfArms
struct CoatOfArmss: Codable {
    let png: String
    let svg: String
}

// MARK: - Currencies
struct Currenciess: Codable {
    let eur: Eur

    enum CodingKeys: String, CodingKey {
        case eur = "EUR"
    }
}

// MARK: - Eur
struct Eur: Codable {
    let name, symbol: String
}

// MARK: - Demonyms
struct Demonymss: Codable {
    let eng, fra: Eng
}

// MARK: - Eng
struct Engg: Codable {
    let f, m: String
}

// MARK: - Flags
struct Flagss: Codable {
    let png: String
    let svg: String
    let alt: String
}

// MARK: - Gini
struct Gini: Codable {
    let the2018: Double

    enum CodingKeys: String, CodingKey {
        case the2018 = "2018"
    }
}

// MARK: - Idd
struct Idds: Codable {
    let root: String
    let suffixes: [String]
}

// MARK: - Languages
struct Language: Codable {
    let spa, cat, eus, glc: String
}

// MARK: - Maps
struct Map: Codable {
    let googleMaps, openStreetMaps: String
}

// MARK: - Name
struct Names: Codable {
    let common, official: String
    let nativeName: NativeName
}

// MARK: - NativeName
struct NativeName: Codable {
    let spa: Translation
}

// MARK: - Translation
struct Trans: Codable {
    let official, common: String
}

// MARK: - PostalCode
struct PostCode: Codable {
    let format, regex: String
}

//typealias SearchEmpty = [CountrySearchModel]
