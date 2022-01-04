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
    var showPaginationLoading : Dynamic<Bool> = Dynamic(false)

    
    var baseReposList =  [Repo]()
    var chunckedList = [[Repo]]()
    var itemsParPage = 10
    var curruntPage = 0
    
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
                
                self.baseReposList = value
                self.chunkReturnedList(list: value)
                
            case .failure(let error):
                print("error == VM " , error.localizedDescription)
                self.errorMessage.value = error.localizedDescription
            }
        }
    }
    
    
    func chunkReturnedList(list:[Repo]){
            chunckedList = list.chunked(into: itemsParPage)
            if !chunckedList.isEmpty {
                self.reposList.value?.append(contentsOf:chunckedList.first!)
            }

    }
    
    func loadMoreData(){
        let nextPage = curruntPage+1
        if nextPage <= (chunckedList.count-1){
            curruntPage += 1
            showPaginationLoading.value = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                self.reposList.value?.append(contentsOf:self.chunckedList[nextPage])
                self.showPaginationLoading.value = false
            }
        }
    }
    
    
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
