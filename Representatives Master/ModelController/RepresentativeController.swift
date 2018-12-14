//
//  RepresentativeController.swift
//  Representatives Master
//
//  Created by Greg Hughes on 12/13/18.
//  Copyright © 2018 Greg Hughes. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseUrl = URL(string:"http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepresentatives(forState state: String, completion: @escaping ([Representative]?) -> Void) {
        
        guard let url = baseUrl else {completion(nil) ; return}
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItem = URLQueryItem(name: "state", value: state)
        let secondQueryItem = URLQueryItem(name: "output", value: "json")
        components?.queryItems = [queryItem,secondQueryItem]
        
        
        guard let completeUrl = components?.url else {completion(nil) ; return}
        
        print(completeUrl)
        
        
        URLSession.shared.dataTask(with: completeUrl) { (data, _, error) in
            if let error = error {
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data,
                let responseDataString = String(data: data, encoding: .ascii),
                let fixedData = responseDataString.data(using: .utf8) else { // Convert string back to UTF8 data
                    NSLog("Unable to get representatives for \(state): No data returned.")
                    completion([])
                    return
            }
            
            do{
                
                let jsonDecoder = JSONDecoder()
                let resultDictionary = try jsonDecoder.decode(TopLevelDictionary.self, from: fixedData)
                let result = resultDictionary.results
                completion(result)
                
            }catch{
                print("❌ There was an error in \(#function) \(error) : \(error.localizedDescription)")
            }
            
            }.resume()
        
        
        
        
        
        
        
    }
    
    
}
