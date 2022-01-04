//
//  ReposListVM.swift
//  ReposListApp
//
//  Created by Ebrahim Attalla on 1/3/22.
//

import Bond
class ReposListVM:BaseViewModel{
    
    //MARK:- GateWay  & Passed Data---
    let dataGateWay : DataServiceProtocol
    
    
    
    //MARK:- Observation  ----
    var searchKey: Observable<String?> = Observable("")
    var reposList: Dynamic<[Repo]?> = Dynamic([])
    
    
    
    
    //MARK:- DI ----
    init( dataGateWay : DataServiceProtocol = DataGetway()) {
        self.dataGateWay = dataGateWay
    }
    
    
    
    
    //MARK:- init of View Model  ----
    override func hydrate() {
        
        
    }
    
    
    
    //MARK:- API   ----
    
    func fetchReposList(){
        
        showLoading()
        dataGateWay.fetchReposList { [weak self](response) in
            guard let self = self  else {return}
            self.hideLoading()
            switch response{
            case .success(let value):
                
                self.reposList.value?.removeAll()
                self.reposList.value?.append(contentsOf: value)
            //    print(" reposList == " , self.reposList.value?.first)

            case .failure(let error):
                print("error == VM " , error.localizedDescription)
                self.errorMessage.value = error.localizedDescription
            }
            
        }
        
        
        
        
    }
    
    
    
    
}

