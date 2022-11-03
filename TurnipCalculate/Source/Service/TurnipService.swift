//
//  TurnipService.swift
//  TurnipCalculate
//
//  Created by KangMingyo on 2022/09/18.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

struct TurnipService {
    
    func getTurnip(sun: String, monAm: String, monPm: String, tueAm: String, tuePm: String, wedAm: String, wedPm: String, thuAm: String, thuPm: String, friAm: String, friPm: String, satAm: String, satPm: String, completion: @escaping (Result<Turnip, NetworkError>) -> Void) {
        let url = URL(string: "https://api.ac-turnip.com/data/?f=\(sun)-\(monAm)-\(monPm)-\(tueAm)-\(tuePm)-\(wedAm)-\(wedPm)-\(thuAm)-\(thuPm)-\(friAm)-\(friPm)-\(satAm)-\(satPm)")
        guard let url = url else {
            return completion(.failure(.badUrl))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let response = try? JSONDecoder().decode(Turnip.self, from: data)
            if let response = response {
                //print("response : \(response)")
                completion(.success(response))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
