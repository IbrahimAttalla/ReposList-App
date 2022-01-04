//
//  APIClient.swift
//
//  Created by MAC on 1/21/19.
//  Copyright © 2019 Dalia Hosny. All rights reserved.
//

import Foundation
//import Alamofire

var networkMSG:String{
    return NSLocalizedString("Please Check Your Internet Connection \nAnd Try Again", comment: "")
}

protocol APIClient {
    func getRequest(apiURL: String, withParameter parameter: String,  completion: @escaping (_ responce : Result<Any, ServiceError>) -> ())
    
}

class APIClientImp: APIClient {
    
    
    func getRequest(apiURL: String, withParameter parameter: String = "",   completion: @escaping (_ responce : Result<Any, ServiceError>) -> ()) {
        if InternetConnectionManager.isConnectedToNetwork(){
            
        let reposUrl = URLComponents(string: "\(Config.sharedInstance.baseUrl!)\(apiURL)")
        var request = URLRequest(url: reposUrl!.url!)
        let session = URLSession.shared
        request.httpMethod = "GET"
        let task = session.dataTask(with: request as URLRequest) { data, response, error in

            if let httpResponse = response as? HTTPURLResponse {
                    print("statusCode == " ,httpResponse.statusCode)
                    if httpResponse.statusCode == 200 || httpResponse.statusCode == 201{
                        
                        completion(.success(data))
                    }else{
                        completion(.failure(.custom(error?.localizedDescription ?? "")))
                    }
                }

            if error != nil {
                completion(.failure(.custom(error?.localizedDescription ?? "")))
                print("Err", error?.localizedDescription ?? "")
            }

        }
        task.resume()
            
        }
        else{
//
//            var networkError = [String:Any]()
//            networkError["error"] = networkMSG
//            networkError["msg"] = nil
//            networkError["status"] = 600
//            networkError["data"] = nil
//            completion( .success(networkError)   )
//
            
            completion( .failure(.custom(networkMSG)))
            
        }

    }
    
}
