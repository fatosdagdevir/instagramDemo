//
//  PostTableViewCell.swift
//  instagramDemo
//
//  Created by Fatma Dagdevir on 11/25/18.
//  Copyright © 2018 Fatma Dagdevir. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.clipsToBounds = true
    }

    func setupCell(viewModel: PostViewModel) {
        
        nameLabel.text = viewModel.userName
        locationLabel.text = viewModel.location
        postImageView.downloaded(from: viewModel.post)
        profileImageView.downloaded(from: viewModel.userPicture)
        
        imageViewTopConstraint.constant = viewModel.location.isEmpty ? 0 : 5
    }
}
