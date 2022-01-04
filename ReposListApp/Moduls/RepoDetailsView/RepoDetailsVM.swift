//
//  RepoDetailsVM.swift
//  ReposListApp
//
//  Created by Ebrahim Attalla on 1/4/22.
//

import Bond
class RepoDetailsVM:BaseViewModel{
    
    //MARK:- GateWay  & Passed Data---
    
    let dataGateWay : DataServiceProtocol
    
    
    
    //MARK:- Observation  ----
    
    var showLoadingHud : Dynamic<Bool> = Dynamic(false)
    var ownerImg: Dynamic<(UIImage?,String?)> = Dynamic((UIImage(),""))
    var ownerName: Observable<String?> = Observable("")
    var repoName: Observable<String?> = Observable("")
    var repoId: Observable<String?> = Observable("")
    var repoDescription: Observable<String?> = Observable("")
    var nodeId: Observable<String?> = Observable("")

    var selectedRepo:Repo
    var loadingImg = LoadImage()
    
    //MARK:- DI ----
    
    init( dataGateWay : DataServiceProtocol = DataGetway(),selectedRepo:Repo ) {
        self.dataGateWay = dataGateWay
        self.selectedRepo = selectedRepo
    }
    
    
    
    
    //MARK:- init of View Model  ----
    override func hydrate() {

    }
    
    
    
    
    func setData(repo:Repo){
        
        ownerImg.value.1 = repo.owner?.avatarURL  ?? ""
        ownerName.value = repo.owner?.login ?? ""
        repoName.value = repo.fullName ?? ""
        repoId.value = "\(repo.id ?? 0)"
        repoDescription.value = repo.repoDescription
        nodeId.value = repo.nodeID ?? ""
        
        showLoadingHud.value = true
        loadingImg.downloadImage(from: URL(string: repo.owner?.avatarURL ?? "")!   ) { [weak self](img) in
            guard let self = self else{return}
            self.showLoadingHud.value = false
            DispatchQueue.main.async {
                self.ownerImg.value.0 = img
            }
        }

    }
    
    
    
    
    
}
