//
//  RepoDetailsConfigurator.swift
//  ReposListApp
//
//  Created by Ebrahim Attalla on 1/4/22.
//

import UIKit
enum RepoDetailsConfigurator {
    
    case RepoDetailsView(Repo)

    var viewController: UIViewController {
        switch self {
        case .RepoDetailsView(let selectedRepo):
            let id  = "RepoDetailsVCID"
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: id) as! RepoDetailsVC
            let gateway = DataGetway()
            vc.vm = RepoDetailsVM(dataGateWay: gateway, selectedRepo: selectedRepo)
            return vc
        }
    }
}
