//
//  NetworkManager.swift
//  Appetizer
//
//  Created by Shiva on 9/6/24.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    private let appetizerURL = baseURL + "appetizers"
    
    let cache: NSCache = NSCache<NSString, UIImage>()
    
    func getAppetizers(completionHandler: @escaping (Result<[Appetizer], APError>) -> Void) {
        
        guard let url = URL(string: appetizerURL) else {
            
            completionHandler(.failure(.invalidURL))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
         let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            
            if let _ = error {
                
                completionHandler(.failure(.unableToComplete))
                return
            }
             
             guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
              
                 completionHandler(.failure(.invalidResponse))
                 return
             }
             
             guard let data = data else {
                 completionHandler(.failure(.invalidData))
                 return
             }
             
             let decoder = JSONDecoder()
             
             do {
                 let decodedData = try decoder.decode(AppetizerResponse.self, from: data)
                 completionHandler(.success(decodedData.request))
             } catch {
                 completionHandler(.failure(.invalidData))
             }
        })
        task.resume()
    }
    
    func downloadImage(fromURL urlString: String, completionHandler: @escaping (UIImage?) -> Void ){
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completionHandler(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            
            completionHandler(nil)
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            
            
            guard let data = data, let image = UIImage(data: data) else {
                
                completionHandler(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completionHandler(image)
            
        })
        
        task.resume()
    }
}
