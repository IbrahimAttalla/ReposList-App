//
//  DataGateway.swift
//  ReposListApp
//
//  Created by Ebrahim Attalla on 1/2/22.
//

import Foundation



protocol DataServiceProtocol {
    func fetchReposList( completion: @escaping (_ responce: Result<[Bool], ServiceError> ) -> () )
}





// MARK:- DataGetway class

class DataGetway: DataServiceProtocol {
    
    let apiClient: APIClient
    init(apiClient: APIClient = APIClientImp()) { self.apiClient = apiClient }

    func fetchReposList( completion: @escaping (_ responce: Result<[Bool], ServiceError> ) -> ()) {
        let apiURL = "/repositories"
        let params =  ""
        apiClient.getRequest(apiURL: apiURL, withParameter: params ) { (response) in
            switch response{
            case .success(let value):


                print("gateWay Response value " , value)
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
}

