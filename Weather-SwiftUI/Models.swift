//
//  Models.swift
//  Weather-SwiftUI
//
//  Created by Николай Никитин on 07.09.2022.
//

import Foundation

// MARK: - Forecast
struct Forecast: Decodable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

// MARK: - City
struct City: Decodable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct Coord: Decodable {
    let lat, lon: Double
}

// MARK: - List
struct List: Decodable {
    let dt: Int
    let main: MainClass
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility, pop: Int
    let sys: Sys
    let dtTxt: String
}

// MARK: - Clouds
struct Clouds: Decodable {
    let all: Int
}

// MARK: - MainClass
struct MainClass: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double
}

// MARK: - Sys
struct Sys: Decodable {
    let pod: Pod
}

enum Pod: Decodable {
    case d
    case n
}

// MARK: - Weather
struct Weather: Decodable {
    let id: Int
    let main: MainEnum
    let weatherDescription: Description
    let icon: String
}

enum MainEnum: Decodable {
    case clear
    case clouds
}

enum Description: Decodable {
    case brokenClouds
    case clearSky
    case fewClouds
    case overcastClouds
    case scatteredClouds
}

// MARK: - Wind
struct Wind: Decodable {
    let speed: Double
    let deg: Int
    let gust: Double
}
