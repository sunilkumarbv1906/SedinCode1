//
//  SedinViewModel.swift
//  SedinApp
//
//  Created by Deepak on 29/12/21.
//

import Foundation


struct Parser {
    
    func parseSedinData (completion : @escaping([UsersData]) -> ()) {
        
        let api = URL(string: "https://api.github.com/repos/Alamofire/Alamofire/issues")
        
        guard let url = api else {return}
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { sedinData, sedinResponse, error in
            
            if error != nil {
                return
            }
            guard let data = sedinData else {return}
            do{
                let json = try JSONDecoder().decode([UsersData].self, from: data)
                completion(json)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
