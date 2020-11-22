//
//  UserableViewCell.swift
//  JChatDemo
//
//  Created by Abdoulaye Diallo on 11/19/20.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    func loadData(_ user: User){
        self.usernameLabel.text = user.username
        self.statusLabel.text = user.status
        self.avatar.image = UIImage(named: "taylor_swift")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
