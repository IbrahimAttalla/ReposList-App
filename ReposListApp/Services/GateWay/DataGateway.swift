//
//  DataGateway.swift
//  ReposListApp
//
//  Created by Ebrahim Attalla on 1/2/22.
//

import Foundation



protocol DataServiceProtocol {
    func fetchReposList( completion: @escaping (_ responce: Result<[Repo], ServiceError> ) -> () )
}





// MARK:- DataGetway class

class DataGetway: DataServiceProtocol {
    
    let apiClient: APIClient
    init(apiClient: APIClient = APIClientImp()) { self.apiClient = apiClient }

    func fetchReposList( completion: @escaping (_ responce: Result<[Repo], ServiceError> ) -> ()) {
        let apiURL = "/repositories"
        let params =  ""
        apiClient.getRequest(apiURL: apiURL, withParameter: params ) { (response) in
            switch response{
            case .success(let value):


            //    print("gateWay Response value " , value)
                guard let dataResponse = response.value else { return }
                do {
                    let decoder = JSONDecoder()
                    let list = try decoder.decode([Repo].self, from:dataResponse as! Data)
                    completion(.success(list))

                }
                catch let err {
                    completion(.failure(.custom(err.localizedDescription ?? "")))
                }

                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
}

