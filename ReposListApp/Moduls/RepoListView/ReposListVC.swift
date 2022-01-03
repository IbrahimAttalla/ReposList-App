//
//  ReposListVC.swift
//  ReposListApp
//
//  Created by Ebrahim Attalla on 1/2/22.
//

import UIKit

class ReposListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        let gateway = DataGetway()
        gateway.fetchReposList() { (response) in
            print(" vc response " , response.value?.first)
            print(" vc error " , response.error?.localizedDescription ?? "")
        }
    }



}
