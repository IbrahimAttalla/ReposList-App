//
//  RepoListConfigurator.swift
//  ReposListApp
//
//  Created by Ebrahim Attalla on 1/4/22.
//

import UIKit
enum RepoListConfigurator {
    
    case RepoListView

    var viewController: UIViewController {
        switch self {
        case .RepoListView:
            let id  = "ReposListVCID"
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: id) as! ReposListVC
            let gateway = DataGetway()
            vc.vm = ReposListVM(dataGateWay: gateway)
            return vc
        }
    }
}
