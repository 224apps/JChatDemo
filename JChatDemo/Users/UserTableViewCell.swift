//
//  UserableViewCell.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/19/20.
//

import UIKit
import SDWebImage

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    func loadData(_ user: User){
        self.usernameLabel.text = user.username
        self.statusLabel.text = user.status
        self.avatar.loadImage(user.profileImageUrl)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        avatar.layer.cornerRadius  = 30
        avatar.clipsToBounds = true 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
