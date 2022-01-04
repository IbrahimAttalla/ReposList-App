//
//  RepoListRoute.swift
//  ReposListApp
//
//  Created by Ebrahim Attalla on 1/4/22.
//


import UIKit

enum RepoListRoute: Route {
    case repoDetailsView(Repo)
    var defaultStyle: PresentingStyle {
        switch self {
        case .repoDetailsView(_):
            return .push
        }
    }
    
    var destination: UIViewController {
        switch self {
        case .repoDetailsView(let selectedRepo ):
            let viewController = RepoDetailsConfigurator.RepoDetailsView(selectedRepo).viewController
            return viewController
            
        }
    }
}
