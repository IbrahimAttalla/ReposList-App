//
//  APIServiceMoke.swift
//  ReposListAppTests
//
//  Created by Ebrahim Attalla on 1/5/22.
//

import Foundation
@testable import ReposListApp


class APIServiceMoke:ApiDataServiceProtocol{
    var fetchingReposListIsCalled = false
    
    func fetchReposList(completion: @escaping (Result<[Repo], ServiceError>) -> ()) {
        
        fetchingReposListIsCalled = true
        
        
        if let path = Bundle.unitTest.path(forResource: "Stub", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                if let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                       {
                                    let decoder = JSONDecoder()
                                    let list = try decoder.decode([Repo].self, from:jsonResult as! Data)
                                    completion(.success(list))

                      //   completion(.success(jsonResult))
                       }
            } catch let error {
                print("parse error: \(error.localizedDescription)")
                 completion(.failure(.serverBusy))
            }
        } else {
            print("Invalid filename/path.")
             completion(.failure(.serverBusy))
        }

    }
}
