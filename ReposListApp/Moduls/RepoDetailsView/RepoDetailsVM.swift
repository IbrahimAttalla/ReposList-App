//
//  RepoDetailsVM.swift
//  ReposListApp
//
//  Created by Ebrahim Attalla on 1/4/22.
//

import Bond
class RepoDetailsVM:BaseViewModel{
    
    //MARK:- GateWay  & Passed Data---
    
    let dataGateWay : ApiDataServiceProtocol
    
    
    
    //MARK:- Observation  ----
    
    var showLoadingHud : Dynamic<Bool> = Dynamic(false)
    var ownerImg: Dynamic<(UIImage?,String?)> = Dynamic((UIImage(),""))
    var ownerName: Observable<String?> = Observable("")
    var repoName: Observable<String?> = Observable("")
    var repoId: Observable<String?> = Observable("")
    var repoDescription: Observable<String?> = Observable("")
    var nodeId: Observable<String?> = Observable("")

    var url: Observable<String?> = Observable("")
    var fork: Observable<String?> = Observable("")
    var key: Observable<String?> = Observable("")
    var collabration: Observable<String?> = Observable("")
    var teams: Observable<String?> = Observable("")
    var hooks: Observable<String?> = Observable("")
    var issue: Observable<String?> = Observable("")
    var events: Observable<String?> = Observable("")
    var assignees: Observable<String?> = Observable("")
    var branch: Observable<String?> = Observable("")

    var selectedRepo:Repo
    var loadingImg = LoadImage()
    
    //MARK:- DI ----
    
    init( dataGateWay : ApiDataServiceProtocol = DataGetway(),selectedRepo:Repo ) {
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
      
        key.value = repo.keysURL ?? ""
        url.value = repo.url ?? ""
        fork.value = repo.forksURL ?? ""
        collabration.value = repo.collaboratorsURL ?? ""
        teams.value = repo.teamsURL ?? ""
        hooks.value = repo.hooksURL ?? ""
        issue.value = repo.issuesURL ?? ""
        events.value = repo.eventsURL ?? ""
        assignees.value = repo.assigneesURL ?? ""
        branch.value = repo.branchesURL ?? ""

        
        
        
        
        
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
