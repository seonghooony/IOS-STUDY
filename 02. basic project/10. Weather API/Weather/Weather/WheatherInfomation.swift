//
//  WheatherInfomation.swift
//  Weather
//
//  Created by SeongHoon Kim on 2021/12/04.
//

import Foundation

struct WeatherInfomation: Codable {
    let weather: [Wheather]
    let temp: Temp
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case weather
        case temp = "main"
        case name
    }
}

struct Wheather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Temp: Codable {
    let temp: Double
    let feelsLike: Double
    let minTemp: Double
    let maxTemp: Double
    
    //json의 키값 이름과 매핑되도록 함 (키값이름이 서로 달라도 아래같은방식으로 매핑 시킬 수 있음)
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case minTemp = "temp_min"
        case maxTemp = "temp_max"
    }
    
}
