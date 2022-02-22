//
//  NetworkingAPI.swift
//  SoftwareGroup
//
//  Created by MAC on 22/02/22.
//

import Foundation

class NetworkingAPI: NSObject {
    
    static let shared = NetworkingAPI()
    let API_KEY = "522db6a157a748e2996212343221502"
    let NAME_OF_CITY = "Chennai"
    
    func fetchWeatherDetail(completion: @escaping (WeatherModel?, Error?) -> ()) {
        let urlString = "https://api.weatherapi.com/v1/forecast.json?key=\(API_KEY)&q=\(NAME_OF_CITY)&days=7&aqi=no&alerts=no"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch wather detail:", err)
                return
            }
            
            // check response
            guard let data = data else { return }
            do {
                let courses = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async {
                    completion(courses, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }.resume()
    }
}
