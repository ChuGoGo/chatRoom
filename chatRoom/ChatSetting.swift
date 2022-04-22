//
//  ChatSetting.swift
//  chatRoom
//
//  Created by Chu Go-Go on 2022/4/22.
//

import Foundation
//看是誰在聊天
enum Whochat{
    case gril,boy

}
//建立是誰在講話
struct WhichChat{
//    是誰傳送的訊息
    var chat:Whochat
//    訊息內容
    var word:String
}

