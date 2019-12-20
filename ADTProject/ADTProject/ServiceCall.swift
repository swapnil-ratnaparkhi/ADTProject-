//
//  ServiceCall.swift
//  ADTProject
//
//  Created by Swapnil Ratnaparkhi on 12/19/19.
//  Copyright © 2019 Swapnil Ratnaparkhi. All rights reserved.
//

import UIKit

public struct UserInformation: Codable {
    var articles: [Article]
}

public struct Article: Codable {
    var author: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case description = "description"
    }
}



class ServiceCall {
    
    public static let shared = ServiceCall()
    private init() {}
    
    func fetchData(completion: @escaping(UserInformation) -> Void) {
        var request = URLRequest(url: URL(string: "https://newsapi.org/v1/articles?source=the-next-web&sortBy=latest&apiKey=2f98e8fe05a344a3bdd966f65ca550a2")!)
        request.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            if let responseData = request as? HTTPURLResponse, responseData.statusCode != 200 {
                return
            }
            
            do {
                let userInfo = try JSONDecoder().decode(UserInformation.self, from: data)
                completion(userInfo)
            } catch let err {
                print("Error" , err)
            }
            
//            if let body = String(data: data, encoding: String.Encoding.utf8) {
//                print(body)
//            }
        }
        
        task.resume()
    }

}
