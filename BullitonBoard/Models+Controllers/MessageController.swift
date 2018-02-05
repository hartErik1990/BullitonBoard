//
//  MessageController.swift
//  BullitonBoard
//
//  Created by Erik HARTLEY on 2/5/18.
//  Copyright © 2018 Erik HARTLEY. All rights reserved.
//

import Foundation

class MessageController {
    
    static let shared = MessageController()
    let ckManager = CloudKitManager()
    var messages = [Message]() {
        didSet {
            
        }
    }
    
    private init() {
        loadMessages()
    }
    //save a message
    func saveNewMessageWith(text: String) {
        let newMessage = Message(text: text)
        ckManager.save(message: newMessage)
        
    }
    
    //load a message
    func loadMessages() {
        ckManager.load { (records, error) in
            if let error = error {
                print("Error Querying records from cloudkit \(error.localizedDescription)")
                return
            }
            guard let records = records else {return}
            for record in records {
                guard let message = Message(record: record) else {continue}
                self.messages.append(message)
                print("loaded the message")
            }
        }
    }
}













