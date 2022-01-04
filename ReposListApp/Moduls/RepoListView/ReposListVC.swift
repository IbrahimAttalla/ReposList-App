//
//  ReposListVC.swift
//  ReposListApp
//
//  Created by Ebrahim Attalla on 1/2/22.
//

import UIKit
import SkeletonView
import SVProgressHUD

class ReposListVC: BaseViewController {
    
    @IBOutlet weak var reposListTV: UITableView!
    
    lazy var vm: ReposListVM = {
        return ReposListVM()
    }()
    
    var list = [Repo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        
        initBind()
        initView()
        
        let gateway = DataGetway()
        //        gateway.fetchReposList() { (response) in
        //            self.list = response.value!
        //            DispatchQueue.main.async {
        //                self.reposListTV.reloadData()
        //
        //            }
        //            print(" vc response " , response.value?.first)
        //            print(" vc error " , response.error?.localizedDescription ?? "")
        //        }
    }
    
    
    func initView(){
        
        reposListTV.delegate = self
        reposListTV.dataSource = self
        reposListTV.register(UINib(nibName: RepoCell.idAndNib, bundle: nil), forCellReuseIdentifier: RepoCell.idAndNib)
        reposListTV.separatorStyle = .none
        reposListTV.estimatedRowHeight = 130.0
        reposListTV.rowHeight = UITableView.automaticDimension
        
        vm.fetchReposList()

        
    }
    
    func initBind(){
        vm.isLoading.bind { (loadingStatus) in
            print("loadingStatus = " , loadingStatus)
            switch loadingStatus{
            case true:
                DispatchQueue.main.async {
                    self.reposListTV.isSkeletonable = true
                    self.reposListTV.showAnimatedGradientSkeleton()
                    //                    SVProgressHUD.show()
                    //                    SVProgressHUD.setDefaultMaskType(.black)
                }
            case false:
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                    self.reposListTV.stopSkeletonAnimation()
                    self.reposListTV.hideSkeleton()
                    //                    SVProgressHUD.setDefaultMaskType(.clear)
                }
            }
        }
        
        vm.errorMessage.bind{msg in
            //            self.displayError(message: msg)
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                super.presentAlert(withTitle: "", message: msg)
            })
            
        }
        
        
        vm.successMessage.bind{msg in
            //  self.displayTost(message: msg)
            SVProgressHUD.dismiss()
            super.showToastWith(msg)
            
        }
        
        
        vm.errorMessage.bind{msg in
            //           self.displayError(message: msg)
            DispatchQueue.main.async(execute: {
                SVProgressHUD.dismiss()
                super.presentAlert(withTitle: "", message: msg)
            })
        }
        
        vm.reposList.bind { (list) in
            DispatchQueue.main.async {
                self.reposListTV.reloadData()
                
            }
            
        }
        
        
    }
    
    
    
    
    
}

extension ReposListVC: UITableViewDelegate , UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (vm.reposList.value?.count ?? 0) == 0 ? 3:vm.reposList.value?.count ?? 0
     //   return vm.reposList.value?.count ?? 0
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepoCell.idAndNib, for: indexPath) as! RepoCell
       
        if vm.reposList.value?.count ?? 0 != 0{
        cell.configure(repo: vm.reposList.value![indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  130.0 // UITableView.automaticDimension
    }
    
    
}
