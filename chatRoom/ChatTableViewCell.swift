//
//  ChatTableViewCell.swift
//  chatRoom
//
//  Created by Chu Go-Go on 2022/4/20.
//

import UIKit
import Foundation

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var chatImageView: UIImageView!
    
    @IBOutlet weak var chatTextView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        設定TextView距離
        chatTextView.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        chatTextView.textContainerInset = .init(top: 10, left: 10, bottom: 10, right: 10)
//        設定對話匡圓角
       chatTextView.layer.cornerRadius = 10
//        設定圖片圓型
        chatImageView.layer.cornerRadius = 25
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
