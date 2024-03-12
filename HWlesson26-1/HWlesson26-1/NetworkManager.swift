//
//  NetworkManager.swift
//  HWlesson26-1
//
//  Created by Карина Дьячина on 12.03.24.
//

//import Foundation
//class NetworkManager {
//    
//    static func performGetRequest(url: URL, completion: @escaping (Result<[Users], Error>) -> Void) {
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            guard let data = data else {
//                completion(.failure(NSError(domain: "Data is nil", code: 0, userInfo: nil)))
//                return
//            }
//            do {
//                let users = try JSONDecoder().decode([Users].self, from: data)
//                completion(.success(users))
//            } catch {
//                completion(.failure(error))
//            }
//        }
//        task.resume()
//    }
//}
