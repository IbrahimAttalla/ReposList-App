//
//  RepoDetailsVC.swift
//  ReposListApp
//
//  Created by Ebrahim Attalla on 1/4/22.
//

import UIKit
import ANZSingleImageViewer

class RepoDetailsVC: BaseViewController {
    
    @IBOutlet weak var ownerImg: UIImageView!
    @IBOutlet weak var ownerNameLbl: UILabel!
    @IBOutlet weak var loadingHud: UIActivityIndicatorView!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nodeIdLbl: UILabel!
    
    @IBOutlet weak var urlLbl: UILabel!
    @IBOutlet weak var forkUrl: UILabel!
    @IBOutlet weak var keyLbl: UILabel!
    @IBOutlet weak var collabrationLbl: UILabel!
    @IBOutlet weak var teamsLbl: UILabel!
    @IBOutlet weak var hooksLbl: UILabel!
    @IBOutlet weak var issueLbl: UILabel!
    @IBOutlet weak var eventsLbl: UILabel!
    @IBOutlet weak var assigneesLbl: UILabel!
    @IBOutlet weak var branchLbl: UILabel!
    
    
    var vm:RepoDetailsVM!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBind()
        initView()
        
    }
    
    
    func initView(){
        
        hideKeyboardWhenTappedAround()
        title = vm.selectedRepo.name ?? ""
        vm.setData(repo: vm.selectedRepo)
    }
    
    func initBind(){
        
        
        
        vm.ownerImg.bind {[unowned self] image in
            if (image.0 != UIImage()){
                self.ownerImg.image = image.0
            }
        }
        
        vm.showLoadingHud.bind { (show) in
            DispatchQueue.main.async {

                if show {
                    self.loadingHud.isHidden = false
                    self.loadingHud.startAnimating()
                    
                }else{
                    self.loadingHud.isHidden = true
                    self.loadingHud.stopAnimating()
                }
            }
        }
        
        vm.ownerName.bind(to: ownerNameLbl)
        vm.repoName.bind(to: repoNameLbl)
        vm.repoId.bind(to: idLbl)
        vm.repoDescription.bind(to: descriptionLbl)
        vm.nodeId.bind(to: nodeIdLbl)
      
        vm.url.bind(to: urlLbl)
        vm.key.bind(to: keyLbl)

        vm.fork.bind(to: forkUrl)
        vm.collabration.bind(to: collabrationLbl)
        vm.teams.bind(to: teamsLbl)
        vm.hooks.bind(to: hooksLbl)
        vm.issue.bind(to: issueLbl)
        vm.events.bind(to: eventsLbl)
        vm.assignees.bind(to: assigneesLbl)
        vm.branch.bind(to: branchLbl)

        
        
    }
    
   
    @IBAction func showOwnerImg(_ sender: Any) {
        guard let img = ownerImg.image else{return}
        ANZSingleImageViewer.showImage(img, toParent: self)

    }

    
    
}
