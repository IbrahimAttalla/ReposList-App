//
//  RepoCell.swift
//  ReposListApp
//
//  Created by Ebrahim Attalla on 1/4/22.
//

import UIKit

class RepoCell: UITableViewCell {

    static var idAndNib = "RepoCell"

   var loadingImg =  LoadImage()
    @IBOutlet weak var ownerNameLbl: UILabel!
    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var loadingHud: UIActivityIndicatorView!
    @IBOutlet weak var ownerImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func configure(repo:Repo){
        
        ownerNameLbl.text = repo.owner?.login ?? ""
        repoNameLbl.text = repo.name ?? ""
        
        ownerImg.image = nil
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else{return}
            self.loadingHud.isHidden = false
            self.loadingHud.startAnimating()
        }
        
        
        loadingImg.downloadImage(from: URL(string: repo.owner?.avatarURL ?? "")!   ) { [weak self](img) in
            guard let self = self else{return}
            DispatchQueue.main.async {
                self.loadingHud.isHidden = true
                self.loadingHud.stopAnimating()

            self.ownerImg.image = img
            }
        }
        
    }
    
    
    
}
