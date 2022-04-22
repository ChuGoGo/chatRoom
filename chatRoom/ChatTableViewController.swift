//
//  ChatTableViewController.swift
//  chatRoom
//
//  Created by Chu Go-Go on 2022/4/20.
//

import UIKit

class ChatTableViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var chattextField: UITextField!
    @IBOutlet weak var whoLabel: UILabel!
    @IBOutlet weak var leftRightSwitch: UISwitch!
    @IBOutlet weak var whichLabel: UILabel!
//    編輯對話的內容
    var chatRoom = [WhichChat(chat: Whochat.gril, word: "今天日期2022年4月20日"),WhichChat(chat: Whochat.boy, word: "是什麼大日子嗎？"),WhichChat(chat: Whochat.gril, word: "我不知道"),WhichChat(chat: Whochat.gril, word: "你知道嗎？"),WhichChat(chat: Whochat.boy, word: "你都不知道我怎麼可能知道")]
    override func viewDidLoad() {
        super.viewDidLoad()
//        收鍵盤
        chattextField.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        self.view.addGestureRecognizer(tap)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
//    收鍵盤
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc func dismissKeyBoard(){
        self.view.endEditing(true)
    }
    

    // MARK: - Table view data source
//    回傳幾個Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
//回傳有幾個tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return chatRoom.count
    }
//    把tableView的資料傳入UITableViewCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        建立一個裝著對話筐裡面的東西
        let chat = chatRoom[indexPath.row]
//        如果裡面的內容是男生的就會跑到男生的cell
        if chat.chat == .boy{
           let cell = tableView.dequeueReusableCell(withIdentifier: "\(RightChatTableViewCell.self)", for: indexPath) as? RightChatTableViewCell
//            內容就是輸入的內容
            cell?.rightTextView.text = chat.word
            return cell!
//            如果是女生的就會跑到女生的cell
        }else if chat.chat == .gril{
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(ChatTableViewCell.self)", for: indexPath) as? ChatTableViewCell
             cell?.chatTextView.text = chat.word
            return cell!
        }
        return UITableViewCell()
    }
//    不會讓選到的row變成深色
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
//    選擇聊天室訊息是左邊還是右邊發送
    @IBAction func whosChat(_ sender: UISwitch) {
        if sender.isOn {
            whichLabel.text = "右"
        }else{
            whichLabel.text = "左"
        }
    }
//    傳送文字
    @IBAction func sentMessage(_ sender: UIButton) {
//        讓訊息等於textField.text!
        let message = chattextField.text!
//        如果是開著的就是右邊的
        if leftRightSwitch.isOn {
//            是右邊的話chatRoom.append男生的對話匡內容就是textField.text!
            chatRoom.append(.init(chat: .boy, word: message))
//            關掉就是左邊
        }else {
            chatRoom.append(.init(chat: .gril, word: message ))
        }
//        把資料上傳到 tableView更新
        tableView.reloadData()
//        傳完Field.text清空
        chattextField.text = ""
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
