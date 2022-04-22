//
//  RightChatTableViewCell.swift
//  chatRoom
//
//  Created by Chu Go-Go on 2022/4/22.
//

import UIKit

class RightChatTableViewCell: UITableViewCell {
    @IBOutlet weak var rightTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        rightTextView.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        rightTextView.textContainerInset = .init(top: 10, left: 10, bottom: 10, right: 10)
       rightTextView.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
