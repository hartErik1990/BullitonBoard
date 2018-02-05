//
//  MainTableViewController.swift
//  BullitonBoard
//
//  Created by Erik HARTLEY on 2/5/18.
//  Copyright © 2018 Erik HARTLEY. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    @IBOutlet weak var messageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //listed for message and act accordingly 
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MessageController.shared.messages.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)

        let message = MessageController.shared.messages[indexPath.row]
        cell.textLabel?.text = message.text
        cell.detailTextLabel?.text = message.date.description
        
        return cell
    }
    
    @IBAction func postButtonPushed(_ sender: Any) {
        guard let text = messageTextField.text, !text.isEmpty else {return}
        MessageController.shared.saveNewMessageWith(text: text)
    }
    
}
