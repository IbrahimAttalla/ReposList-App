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

    
    //MARK:- DI ----
    init( dataGateWay : DataServiceProtocol = DataGetway()) {
        self.dataGateWay = dataGateWay
    }
    
    
    //MARK:- init of View Model  ----
    override func hydrate() {

        
    }
    
    //MARK:- API   ----

    

}

